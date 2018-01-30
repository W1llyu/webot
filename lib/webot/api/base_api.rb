require 'httparty'
require 'pry'
require_relative '../configuration'

module Webot
  module Api
    class BaseApi
      include HTTParty
      follow_redirects false
      def self.base_url
        @base_url ||= config.base_url
      end

      def self.config
        Configuration.instance
      end

      def self.send_request(method, url, req_opts)
        self.public_send(method, url, req_opts)
      end

      protected
      def self.build_request(params = {}, headers = {}, options = {})
        { query: params, headers: headers }.merge(options)
      end

      def self.url_with_params(base_url, params)
        url = base_url
        params.each do |k, v|
          flag = url.include?('?') ? '&' : '?'
          url = "#{url}#{flag}#{k}=#{v}"
        end
        url
      end
    end
  end
end