# Dependencies
require 'faraday'
require 'faraday_middleware'
require 'net/http'

require "messaging_service/version"

module MessagingService
  # Your code goes here
  def self.connection
    @connection
  end

  def self.options
    @options
  end

  def self.configure # (&blk) pass code block in params from the main app
    # Messaging service config is new OpenStruct object
    # use this to dynamically get configurations for the gem
    # @options = MessagingService::Config.new 
    # yield gives a call to 
    # yield(@options)
    #yield config  # remove this when we get config from main app
    #

    @connection = Faraday.new(:url => 'http://localhost:3001') do |builder|
      #builder.use Faraday::Response::Logger, @options.logger || :logger
      builder.use Faraday::Adapter::Excon
      builder.use FaradayMiddleware::ParseJson #cool for parsing response bodies
    end
  end

  # Clean up this method to remove hardcoded url instead
  # use app config from the main application defined in 
  # config/initilizes/messaging_service.rb as this file
  # picks config depending on the configuration.
  # hardcoding here will make this fail in production.
  # 
  def self.config
    # Change this thing... get it from main app.
    @options ||= OpenStruct.new(:url => 'http://localhost:3001')
  end

  # Require all the files from within the gem on gem
  # Otherwise the features in file won't work.
  # messaging_service.rb is the main point of gem start.
  require 'messaging_service/base_client'   # common code fr gem setup/all inherit this
  require 'messaging_service/message' 
end
