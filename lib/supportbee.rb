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
     valid_keys = [:per_page, :page, :spam, :trash, :replies, :max_replies, :assigned_user, :assigned_group, :starred, :label, :since, :until,:agent,:group]
     invalid_keys = options.keys - valid_keys

     raise "Invalid Options: #{invalid_keys.join(', ')}" unless invalid_keys.empty?
     unless options[:agent].nil?
       options[:assigned_user]= self.users(options[:agent])     
     end
     unless options[:group].nil?
       options[:assigned_group]= self.groups(options[:group])
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
   
    def groups(group)            
      response=self.class.get("/groups.json")
      groups=JSON.parse(response.body)
      puts groups
      groups["groups"].each { |group| return group if group['name']==group}      
    end

  end
end

