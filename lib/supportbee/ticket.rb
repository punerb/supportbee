 module Supportbee
   module Ticket
     def tickets(options={})
       valid_keys = [:per_page, :page, :spam, :trash, :replies, :max_replies, :assigned_user, :assigned_group, :starred, :label, :since, :until]
       invalid_keys = options.keys - valid_keys

       raise "Invalid Options: #{invalid_keys.join(', ')}" unless invalid_keys.empty?

       self.class.default_params.merge!(options)

       response = self.class.get("/tickets.json")
       result = JSON.parse(response.body)
       result['tickets'].map do |ticket|
         {ticket['id'] => ticket['subject']}
       end
     end
   end
 end
