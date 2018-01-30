require 'webot/version'
require 'webot/client'
require 'webot/configuration'

module Webot
  class << self
    attr_writer :client

    def client
      @client ||= Client.new
    end
  end
end
