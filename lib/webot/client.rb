require 'rexml/document'
require_relative 'entities/init'
require_relative 'concern/init'

module Webot
  class Client
    include SessionConcern
    include MessageConcern
    include CookieConcern

    def initialize
      load_session
    end

    def is_login?
      @session.is_login
    end

    def login
      return if is_login?
      generate_qr_png
      wait_for_login
      init_after_login if is_login?
      return is_login?
    end

    def begin_receiving
      wait_for_message
    end

    def log_out
      @session = Session.new
    end

    private
    def init_after_login
      # save_local_session
      web_init
      show_mobile_login
      # ToDo get contacts
    end
  end
end
