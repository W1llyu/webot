module Webot
  module CookieConcern
    private
    def update_cookie(str_cookie)
      @session.cookie = Hash.new if @session.cookie.nil?
      str_cookie.scan(/[^,|"|\s]+=[^,|;|\s]+/).each do |s|
        tmp_scan = s.scan(/(\S+)=(\S+)/)
        key = tmp_scan[0][0]
        next if %w(Domain Path Expires).include?(key)
        @session.cookie[key] = tmp_scan[0][1]
      end
    end
  end
end