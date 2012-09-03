require 'hirb'

 module Supportbee
   module Ticket
     def tickets(options={})
       valid_keys = [:per_page, :page, :spam, :trash, :replies, :max_replies, :assigned_user, :assigned_group, :starred, :label, :since, :until]
       invalid_keys = options.keys - valid_keys

       raise "Invalid Options: #{invalid_keys.join(', ')}" unless invalid_keys.empty?


       response = @api.get("/tickets.json", options)
       output = []
       response['tickets'].each do |ticket|
         output << {'id' => ticket['id'], 'Assigned To' => ticket['current_assignee']['name'], 
                    'Requester' => ticket['requester']['name'], 'subject' => ticket['subject']}
       end
       puts Hirb::Helpers::AutoTable.render(output)
     end
   end
 end
