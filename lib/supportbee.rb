require 'supportbee/version'
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

    def initialize(company, auth_token)
      self.class.base_uri "https://#{company}.supportbee.com"
      self.class.default_params :auth_token => auth_token
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
