require 'hirb'

module Supportbee
  module Agent 

    # Agents listing
    def agents(options={})
      response = @api.get('/users.json')

      output = []
      response['users'].each do |user|
        output << {"Agents" => user['name']}
      end
      puts Hirb::Helpers::AutoTable.render(output)
    end

    # Returns ID of a user 
    def agent(assigned_user="")
      response = @api.get('/users.json')

      users = {}
      response['users'].each { |u| users[u['name']] = u['id'] }
      users["#{assigned_user}"]
    end
  end
end
