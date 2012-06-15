require "supportbee/version"
require 'httparty'

module Supportbee
  class Base
    include HTTParty

    base_uri "https://josh.supportbee.com"

    def initialize(auth_token)
      self.class.default_params :auth_token => auth_token
    end

    def tickets(options={})
      response = self.class.get("/tickets.json")
      response.body
    end
  end
end

