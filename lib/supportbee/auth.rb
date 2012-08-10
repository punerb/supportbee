module Supportbee 
  module Auth
    def self.authenticate
      p 'Please enter Company Name : '
      company_name = gets.chomp
      p 'Please enter Authentication Token :'
      token = gets.chomp
      puts %x[mkdir ~/.supportbee] if !File.exists?(File.expand_path('~/.supportbee'))
      f = File.new(File.expand_path("~/.supportbee/credentials"), 'w')
      f.write("company: #{company_name}")
      f.write("token:#{token}")
     [ company_name, token]
    end
  end
end
