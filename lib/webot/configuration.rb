module Webot
  class Configuration
    attr_accessor :base_url
    attr_accessor :dir
    attr_accessor :default_qr
    attr_accessor :timeout
    attr_accessor :user_agent
    attr_accessor :auto_login

    def self.instance
      @configuration ||= self.new
    end

    private
    def initialize
      self.base_url = 'https://login.weixin.qq.com'
      self.dir = '/tmp'
      self.default_qr = 'QR.png'
      self.timeout = [10, 60]
      self.user_agent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36'
      self.auto_login = true
    end
  end
end