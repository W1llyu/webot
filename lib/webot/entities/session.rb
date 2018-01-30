require 'active_type'

module Webot
  class Session < ActiveType::Object
    DUMP_PATH = "#{File.dirname(__FILE__)}/session.json"

    attribute :is_login, :boolean, default: false
    attribute :base64_avatar, :string
    attribute :url, :string
    attribute :file_url, :string
    attribute :sync_url, :string
    attribute :device_id, :string
    attribute :skey, :string
    attribute :sid, :string
    attribute :uin, :string
    attribute :pass_ticket, :string
    attribute :cookie, :hash

    def initialize
      self.device_id = "e#{rand(999999999999999)}"
    end

    def login_completed
      self.is_login = true
      generate_url
    end

    # 组装成一个BaseRequest结构 在一些地方需要作为消息体用
    def base_request
      {
        Skey: self.skey,
        Sid: self.sid,
        Uin: self.uin,
        DeviceID: self.pass_ticket
      }
    end

    def cookie_str
      self.cookie.map {|k,v| "#{k}=#{v}"}.join(';')
    end

    # ========== Reload Session ==========
    # 持久化登录信息到本地
    def dump
      file = File.open(DUMP_PATH, 'w+')
      file.puts(self.to_hash.to_json)
      file.close
    end

    def self.load!
      return nil unless File.exist?(DUMP_PATH)
      file = File.open(DUMP_PATH, 'r')
      instance = self.new
      JSON.parse(file.map {|line| line}.join).each do |k, v|
        eval("instance.#{k} = v")
      end
      instance
    end

    def to_hash
      h = Hash.new
      attributes.each {|k| h[k] = self.public_send(k)}
      h
    end

    private
    def generate_url
      return if self.url.nil?
      url_map.each do |k, v|
        next unless self.url.include?(k.to_s)
        self.url = self.url.slice(0, self.url.rindex('/'))
        self.file_url = "https://#{v.file_domain}/cgi-bin/mmwebwx-bin"
        self.sync_url = "https://#{v.sync_domain}/cgi-bin/mmwebwx-bin"
      end
    end

    def url_map
      api_domain = Struct.new(:file_domain, :sync_domain)
      {
        'wx2.qq.com': api_domain.new('file.wx2.qq.com', 'webpush.wx2.qq.com'),
        'wx8.qq.com': api_domain.new('file.wx8.qq.com', 'webpush.wx8.qq.com'),
        'qq.com': api_domain.new('file.wx.qq.com', 'webpush.wx.qq.com'),
        'web2.wechat.com': api_domain.new('file.web2.wechat.com', 'webpush.web2.wechat.com'),
        'wechat.com': api_domain.new('file.web.wechat.com', 'webpush.web.wechat.com')
      }
    end

    def attributes
      %w(is_login base64_avatar url file_url sync_url device_id skey sid uin pass_ticket)
    end
  end
end
