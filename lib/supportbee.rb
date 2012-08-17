require "supportbee/version"
require "supportbee/auth"
require "supportbee/api"
require "supportbee/ticket"
require 'httparty'
require 'json'
require 'supportbee/agent'
require 'supportbee/label'

module Supportbee
  class Base
    #include HTTParty
    include Supportbee::Ticket
    include Supportbee::Agent
    include Supportbee::Label
    #include Supportbee::Auth

    def initialize
      #company, auth_token = Supportbee::Auth.authenticate 
      #self.class.base_uri "https://#{company}.supportbee.com"
      #self.class.default_params :auth_token => auth_token
      @api = Supportbee::Api.new
    end


    # this method will receive command line methods and 
    # options and will pass it on accordingly
    def self.call(cmd, options)
      options.delete(:verbose)
      options.delete(:logfile)
      self.new.send(cmd, options)
    end
    
  end
end
