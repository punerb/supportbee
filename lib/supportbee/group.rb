require 'hirb'

module Supportbee
  module Group

    # Supportbee only allows you to fetch tickets of a particular group using group ID not group name
    def groups(options={})
      response = @api.get('/groups.json')

      output = []
      response['groups'].each do |group|
        output << {"Group Name" => group['name']}
      end
      puts Hirb::Helpers::AutoTable.render(output)
    end

    # Returns ID of a group
    def group(assigned_group="")
      response = @api.get('/groups.json')

      groups = {}
      response['groups'].each { |g| groups[g['name']] = g['id'] }
      groups["#{assigned_group}"]
    end
  end
end
