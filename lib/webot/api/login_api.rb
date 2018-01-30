require_relative 'base_api'

module Webot
  module Api
    class LoginApi < BaseApi
      def self.fetch_login_info(uuid)
        now_stamp = Time.now.to_i
        url = "#{base_url}/cgi-bin/mmwebwx-bin/login"
        params = {
          loginicon: 'true',
          uuid: uuid,
          tip: 1,
          r: ((-now_stamp)/1579).to_i,
          _: now_stamp
        }
        headers = {
          'User-Agent': config.user_agent
        }
        send_request('get', url, {
          query: params,
          headers: headers
        })
      end

      def self.do_login(url)
        headers = {
          'User-Agent': config.user_agent
        }
        send_request('get', url, {
          headers: headers
        })
      end

      def self.web_init(session)
        url = "#{session.url}/webwxinit"
        query = {
          r: ((-Time.now.to_i)/1579).to_i,
          pass_ticket: session.pass_ticket
        }
        params = {
          BaseRequest: session.base_request
        }
        headers = {
          'User-Agent': config.user_agent,
          'Content-Type': 'application/json; charset=UTF-8'
        }
        send_request('post', url, {
          query: query,
          body: params.to_json,
          headers: headers
        })
      end

      def self.show_mobile_login(session, user, lang='zh_CN')
        url = "#{session.url}/webwxstatusnotify"
        query = {
          lang: lang,
          pass_ticket: session.pass_ticket
        }
        params = {
          BaseRequest: session.base_request,
          Code: 3,
          FromUserName: user.user_name,
          ToUserName: user.user_name,
          ClientMsgId: Time.now.to_i
        }
        headers = {
          'User-Agent': config.user_agent,
          'Content-Type': 'application/json; charset=UTF-8'
        }
        send_request('post', url, {
          query: query,
          body: params.to_json,
          headers: headers
        })
      end
    end
  end
end
