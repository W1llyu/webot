require 'rexml/document'
require_relative '../api/qr_api'
require_relative '../api/login_api'

module Webot
  module SessionConcern
    private
    def load_session
      if Configuration.instance.auto_login
        @session = Session.load!
      end
      @session ||= Session.new
    end

    # ========== 保存登录信息到本地 ========
    def save_local_session
      return false unless @session.is_login
      @session.dump
      true
    end

    # ========== 生成登录二维码 ==========
    def generate_qr_png
      Api::QrApi.generate_qr_png(get_qr_uuid)
    end

    # 获取uuid
    def get_qr_uuid
      @uuid ||= generate_qr_uuid
    end

    def regenerate_qr_uuid
      @uuid = generate_qr_uuid
    end

    def generate_qr_uuid
      res = Api::QrApi.get_qr_uuid
      return nil if res.body.nil?
      ar_scan = res.body.scan(/window\.QRLogin\.code\s*=\s*(\d+);\s*window\.QRLogin\.uuid\s*=\s*"(\S+?)";/)
      return nil if ar_scan[0].length != 2 || ar_scan[0][0] != '200'
      return ar_scan[0][1]
    end

    # ========== 登录 ==========
    # 轮询获取登录信息
    def wait_for_login
      while true
        res = Api::LoginApi.fetch_login_info(get_qr_uuid)
        break if res.nil? || res.body.nil?
        login_completed = check_login(res)
        break if login_completed.nil? || login_completed == true
      end
    end

    def check_login(res)
      ar_scan = res.body.scan(/window\.code=(\d+)/)
      return false if ar_scan[0].length == 0
      case ar_scan[0][0].to_i
        when 200
          process_login_info(res)
          return true
        when 201
          process_pre_login_info(res)
          return false
        when 408
          return false
        else
          return nil
      end
    end

    # 用户完成登录，此时能获取登录url
    def process_login_info(response)
      @session.url = response.body.scan(/window\.redirect_uri="(\S+)"/)[0][0]
      do_login
    end

    # 用户扫登录二维码但未确认登录，此时能获取用户头像
    def process_pre_login_info(response)
      if @session.base64_avatar.nil?
        ar_scan = response.body.scan(/window\.userAvatar\s*=\s*'(.*?)'/)
        return if ar_scan[0].length == 0
        @session.base64_avatar = ar_scan[0][0]
        puts 'Please press confirm on your phone'
      end
    end

    # 登录
    def do_login
      return if @session.url.nil?
      res = Api::LoginApi.do_login(@session.url)
      update_cookie(res.headers['set-cookie'])
      doc = REXML::Document.new(res.body)
      ret = doc.root.elements.select {|x| x.name == 'ret'}.first.text.to_i
      login_failed unless ret == 0
      update_session(doc)
    end

    def login_failed
      puts 'Login Failed'
      @uuid = nil
      @session = Session.new
    end

    # 传入一个xmldocument对象
    def update_session(doc)
      elements = doc.root.elements
      @session.skey = elements.select {|x| x.name == 'skey'}.first.try(:text)
      @session.sid = elements.select {|x| x.name == 'wxsid'}.first.try(:text)
      @session.uin = elements.select {|x| x.name == 'wxuin'}.first.try(:text)
      @session.pass_ticket = elements.select {|x| x.name == 'pass_ticket'}.first.try(:text)
      @session.login_completed
      puts 'Login Ok'
    end

    # ========== 初始化 ==========
    def web_init
      res = Api::LoginApi.web_init(@session)
      body = JSON.parse(res.body)
      init_user_info(body['User'])
      update_sync_key(body['SyncKey'])
    end

    # 手机上显示web登录
    def show_mobile_login
      Api::LoginApi.show_mobile_login(@session, @user)
    end

    private
    def init_user_info(user_hash)
      @user = Webot::User.build(user_hash)
    end

    def update_sync_key(sync_key_hash)
      @sync_key = sync_key_hash
    end
  end
end