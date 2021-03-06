module Nokotime
  class Configuration
    include Nokotime::Authentication

    attr_writer   :auth_type
    attr_writer   :max_concurrency
    attr_writer   :token
    attr_accessor :url

    DEFAULT_URL = "https://api.nokotime.com".freeze

    def initialize
      @auth_type = nil
      @max_concurrency = nil
      @token = nil
      @url = DEFAULT_URL
    end

    def auth_type
      unless valid_auth?(@auth_type)
        raise(
          ConfigurationError,
          "#{@auth_type} isn't valid type authentication."
        )
      end

      @auth_type || raise(
        ConfigurationError, "Authentication type missing."
      )
    end

    def max_concurrency
      @max_concurrency || raise(
        ConfigurationError, "Max concurrency missing."
      )
    end

    def token
      @token || raise(
        ConfigurationError, "Token missing."
      )
    end
  end
end
