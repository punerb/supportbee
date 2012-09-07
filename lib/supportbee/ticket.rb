require 'hirb'

module Supportbee
  module Ticket
    def tickets(options={})
      valid_keys = [:per_page, :page, :spam, :trash, :replies, :max_replies, :assigned_user, :assigned_group, :starred, :label, :since, :until]
      invalid_keys = options.keys - valid_keys

      raise "Invalid Options: #{invalid_keys.join(', ')}" unless invalid_keys.empty?

      response = @api.get(build_url(options))
      output = []
      response['tickets'].each do |ticket|
        output << {'id' => ticket['id'], 'Assigned To' => ticket['current_assignee']['name'], 
          'Requester' => ticket['requester']['name'], 'subject' => ticket['subject']}
      end
      puts Hirb::Helpers::AutoTable.render(output)
    end

    def build_url(options={})
      url = "/tickets.json"

      # fetch group ID of a particular project
      group_id = group(options[:assigned_group])
      url = "#{url}?assigned_group=#{group_id}" if options[:assigned_group]
    end
  end
end
