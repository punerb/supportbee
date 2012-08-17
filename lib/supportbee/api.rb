
# 
# Handles all http requests
#
# usage -
#
# @api = Api.new
#
# and then 
#
# @api.get("/tickets", options) #=> should return json object of response
# @api.post("/some_url")
# @api.put("/url", options)
# @api.delete("/url")
#

require 'httparty'
require 'json'

module Supportbee
  class Api
	
    include HTTParty
    include Supportbee::Auth

    def initialize
      # here it should read config file 
      # for auth values.
      company, auth_token = Supportbee::Auth.authenticate 
      self.class.base_uri "https://#{company}.supportbee.com"
      self.class.default_params :auth_token => auth_token
    end

    # 
    # handles get in here..
    def get(url, options = {})
      self.class.default_params.merge!(options)
      response = self.class.get(url)
      handle_response(response)
    end

    def post(url, options= {})
      self.class.default_params.merge!(options)
      self.class.post(url)
      handle_response(response)
    end

    private

    def handle_response(response)
      raise Supportbee::ApiAuthenticationError if response.code.equal?(401)
      raise Supportbee::ApiResponseError unless response.code.equal?(200)
      JSON.parse(response.body) rescue Supportbee::ApiParsingError
    end

  end

  class Supportbee::ApiAuthenticationError < StandardError; end
  class Supportbee::ApiResponseError < StandardError; end
  class Supportbee::ApiParsingError < StandardError; end

end
