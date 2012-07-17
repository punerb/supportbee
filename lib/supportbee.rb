require "supportbee/version"
require 'httparty'

module Supportbee
  class Base
    include HTTParty

    def initialize(company, auth_token)
      self.class.base_uri "https://#{company}.supportbee.com"
      self.class.default_params :auth_token => auth_token
    end

    def tickets(options={})
     valid_keys = [:per_page, :page, :spam, :trash, :replies, :max_replies, :assigned_user, :assigned_group, :starred, :label, :since, :until,:agent]
     invalid_keys = options.keys - valid_keys

     raise "Invalid Options: #{invalid_keys.join(', ')}" unless invalid_keys.empty?
     if options.fetch(:agent)
       options[:assigned_user]= self.users(options[:agent])
     end
     self.class.default_params.merge!(options)
     response = self.class.get("/tickets.json")
     response.body

    end

    def users(agent)            
      response=self.class.get("/users.json")
      users=JSON.parse(response.body)
      users["users"].each { |user| return user['id'] if user['name']==agent}      
    end
  end
end

