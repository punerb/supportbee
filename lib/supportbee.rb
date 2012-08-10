require "supportbee/version"
require "supportbee/tickets"
require 'httparty'
require 'json'

module Supportbee
  class Base
    include HTTParty

    # 
    # TODO : this initialize to be shifted to api.rb
    #
    #def initialize(company, auth_token)
    #  self.class.base_uri "https://#{company}.supportbee.com"
    #  self.class.default_params :auth_token => auth_token
    #end

    # 
    # this method will receive command line methods and 
    # options and will pass it on accordingly
    def self.call(cmd, options)
      self.new.send(cmd, options)
    end
    
  end
end
