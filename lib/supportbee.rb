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
      response = self.class.get("/tickets.json")
      response.body
    end
  end
end

