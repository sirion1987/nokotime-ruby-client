module Nokotime
  module Errors
    class Configuration < StandardError; end
  end

  class Configuration
    attr_writer   :auth_type
    attr_writer   :max_concurrency
    attr_writer   :token
    attr_accessor :url

    DEFAULT_URL = "https://api.noko.com".freeze

    def initialize
      @auth_type = nil
      @max_concurrency = nil
      @token = nil
      @url = DEFAULT_URL
    end

    def auth_type
      @auth_type || raise(
        Errors::Configuration, "Authentication type missing."
      )
    end

    def max_concurrency
      @max_concurrency || raise(
        Errors::Configuration, "Max concurrency missing."
      )
    end

    def token
      @token || raise(
        Errors::Configuration, "Token missing."
      )
    end
  end
end