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
    include Supportbee::Ticket
    include Supportbee::Agent
    include Supportbee::Label

    def initialize
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
