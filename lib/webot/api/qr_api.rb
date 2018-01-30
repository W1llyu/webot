require 'rqrcode'
require 'rqrcode_png'
require_relative 'base_api'

module Webot
  module Api
    class QrApi < BaseApi
      def self.get_qr_uuid
        url = "#{base_url}/jslogin"
        params = {
          appid: 'wx782c26e4c19acffb',
          fun: 'new'
        }
        headers = {
          'User-Agent': config.user_agent
        }
        send_request('get', url, {
            query: params,
          headers: headers
        })
      end

      def self.generate_qr_png(uuid)
        qr = RQRCode::QRCode.new("https://login.weixin.qq.com/l/#{uuid}", size: 10)
        qr.to_img.resize(400, 400).save("#{config.dir}/#{config.default_qr}")
      end
    end
  end
end