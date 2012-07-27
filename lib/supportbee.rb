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

    # 
    # tickets API
    def tickets(options={})

      # 
      # This will be API for all the future modules
      # Module.run(options)
      #
      Tickets.run(options)

      #
      # TODO old code below to be refactored.
      #
     #valid_keys = [:per_page, :page, :spam, :trash, :replies, :max_replies, :assigned_user, :assigned_group, :starred, :label, :since, :until]
     #invalid_keys = options.keys - valid_keys

     #raise "Invalid Options: #{invalid_keys.join(', ')}" unless invalid_keys.empty?

     #self.class.default_params.merge!(options)

      #response = self.class.get("/tickets.json")
      #result = JSON.parse(response.body)
     # result['tickets'].map do |ticket|
     #   {ticket['id'] => ticket['subject']}
     # end
    end
  end
end
