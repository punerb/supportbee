
require "supportbee/version"
require "supportbee/auth"
require "supportbee/api"
require "supportbee/ticket"
require 'supportbee/agent'
require 'supportbee/label'
require 'supportbee/group'

module Supportbee
  class Base
    include Supportbee::Ticket
    include Supportbee::Agent
    include Supportbee::Label
    include Supportbee::Group

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
