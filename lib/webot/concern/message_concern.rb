require_relative '../api/message_api'

module Webot
  module MessageConcern

    def wait_for_message
      while true
        begin
          # 检查是否有未读消息
          pending_check = sync_check
          break if pending_check.nil?
          next unless pending_check
          msg_list, contact_list = get_message
          msg_list.each {|msg| handle_message(msg)}
        rescue
        end
      end
    end

    # 是否有未读消息
    def sync_check
      res = Api::MessageApi.sync_check(@session, @sync_key)
      ar_scan = res.body.scan(/window\.synccheck={retcode:"(\d+)",selector:"(\d+)"}/)
      return nil if ar_scan.blank? || ar_scan[0][0] != '0'
      return ar_scan[0][1] != '0'
    end

    def get_message
      res = Api::MessageApi.get_message(@session, @sync_key)
      body = JSON.parse(res.body)
      return [nil, nil] if body['BaseResponse']['Ret'] != 0
      @sync_key = body['SyncCheckKey']
      return [body['AddMsgList'], body['ModContactList']]
    end

    def message_callback(msg)

    end

    def send_text_message(content, to_user_name)
      res = Api::MessageApi.send_raw_msg(@session, content, @user.user_name, to_user_name)
      body = JSON.parse(res.body)
      if body['BaseResponse']['Ret'] == 0
        puts "Send Text Message OK: #{content}"
      else
        puts "Send Text Message Failed: #{content}"
      end
    end

    private
    def handle_message(message)
      return handle_group_message(message) if message['FromUserName'].include?('@@')
      handle_friend_message(message)
    end

    def handle_group_message(message)
      puts "Get Group Message: #{message['Content']}"
    end

    def handle_friend_message(message)
      puts "Get Friend Message: #{message['Content']}"
      content = "robot reply from [#{@user.nick_name}]: received \"#{message['Content']}\""
      send_text_message(content, message['FromUserName'])
    end
  end
end