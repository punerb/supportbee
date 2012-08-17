require "supportbee/version"
require "supportbee/auth"
require "supportbee/tickets"
require 'httparty'
require 'json'
require 'supportbee/ticket'
require 'supportbee/agent'
require 'supportbee/label'

module Supportbee
  class Base
    include HTTParty
    include Supportbee::Ticket
    include Supportbee::Agent
    include Supportbee::Label
    include Supportbee::Auth

    def initialize
      company, auth_token = Supportbee::Auth.authenticate 
      self.class.base_uri "https://#{company}.supportbee.com"
      self.class.default_params :auth_token => auth_token
    end

    def tickets(options={})
     valid_keys = [:per_page, :page, :spam, :trash, :replies, :max_replies, :assigned_user, :assigned_group, :starred, :label, :since, :until]
     invalid_keys = options.keys - valid_keys

     raise "Invalid Options: #{invalid_keys.join(', ')}" unless invalid_keys.empty?
    end

    # this method will receive command line methods and 
    # options and will pass it on accordingly
    def self.call(cmd, options)
      self.new.send(cmd, options)
    end
    
    #It's takes ticket,agent,label get as parameter and call appropriate module
    #TODO need to finalize parameters
    def self.run cmd
      supportbee = Supportbee::Base.new("josh", "4rP9QFdmxNUyyK-saK7H")
      
      if cmd == "tickets"
        supportbee.tickets
      end
    end
  end
end
