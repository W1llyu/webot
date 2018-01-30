require_relative 'base_api'

module Webot
  module Api
    class MessageApi < BaseApi

      module MsgType
        TEXT = 1
      end

      def self.sync_check(session, sync_key)
        url = "#{session.sync_url.nil? ? session.url : session.sync_url}/synccheck"
        params = {
          r: (Time.now.to_f * 1000).to_i,
          _: (Time.now.to_f * 1000).to_i,
          skey: session.skey,
          sid: session.sid,
          uin: session.uin,
          deviceid: session.device_id,
          synckey: sync_key['List'].map {|x| "#{x['Key']}_#{x['Val']}"}.join('|'),
        }
        headers = {
          'User-Agent': config.user_agent,
          Cookie: session.cookie_str
        }
        send_request('get', url, {
          query: params,
          headers: headers
        })
      end

      def self.get_message(session, sync_key)
        url = "#{session.url}/webwxsync"
        query = {
          sid: session.sid,
          skey: session.skey,
          pass_ticket: session.pass_ticket
        }
        params = {
          BaseRequest: session.base_request,
          SyncKey: sync_key,
          rr: ~Time.now.to_i
        }
        headers = {
          'Content-Type': 'application/json; charset=UTF-8',
          'User-Agent': config.user_agent,
        }
        send_request('post', url, {
          query: query,
          body: params.to_json,
          headers: headers
        })
      end

      def self.send_raw_msg(session, content, from_user, to_user)
        url = "#{session.url}/webwxsendmsg"
        params = {
          BaseRequest: session.base_request,
          Msg: {
            Type: MsgType::TEXT,
            Content: content,
            FromUserName: from_user,
            ToUserName: to_user,
            LocalID: Time.now.to_i * 1e4,
            ClientMsgId: Time.now.to_i * 1e4
          }
        }
        headers = {
          'Content-Type': 'application/json; charset=UTF-8',
          'User-Agent': config.user_agent,
          Cookie: session.cookie_str
        }
        send_request('post', url, {
          body: params.to_json,
          headers: headers
        })
      end
    end
  end
end