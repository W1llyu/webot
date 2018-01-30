module Webot
  class User < ActiveType::Object
    attribute :uin
    attribute :user_name
    attribute :nick_name
    attribute :head_img_url
    attribute :remark_name
    attribute :star_friend
    attribute :sex
    attribute :signature

    def self.build(raw = {})
      return self.create(
          uin: raw['Uin'],
          user_name: raw['UserName'],
          nick_name: raw['NickName'],
          head_img_url: raw['HeadImgUrl'],
          remark_name: raw['RemarkName'],
          star_friend: raw['RemarkName'],
          sex: raw['Sex'],
          signature: raw['Signature']
      )
    end
  end
end
