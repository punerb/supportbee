require 'hirb'

module Supportbee
  module Ticket
    def tickets(options={})
      valid_keys = [:per_page, :page, :spam, :trash, :replies, :max_replies, :assigned_user, :assigned_group, :starred, :label, :since, :until]
      invalid_keys = options.keys - valid_keys

      raise "Invalid Options: #{invalid_keys.join(', ')}" unless invalid_keys.empty?

      if options[:assigned_group] and options[:assigned_user]
        p "You can list tickets either agent wise or group wise" 
        return
      end
      response = @api.get(build_url(options))
      output = []
      
      response['tickets'].each do |ticket|
        current_assignee_name = ticket['current_assignee'] ? ticket['current_assignee']['name'] : ""
        output << {'id' => ticket['id'], 'Assigned To' => current_assignee_name,  'subject' => ticket['subject']} 
      end
      puts Hirb::Helpers::AutoTable.render(output)
    end

    def build_url(options={})
      url = "/tickets.json"

      if options[:assigned_group]
        # fetch group ID of a particular project
        group_id = group(options[:assigned_group])
        url = "#{url}?assigned_group=#{group_id}"
      end

      if options[:assigned_user]
        # fetch agent ID 
        agent_id = agent(options[:assigned_user])
        url = "#{url}?assigned_user=#{agent_id}" 
      end
      url
    end
  end
end
