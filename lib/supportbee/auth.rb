module Supportbee 
  module Auth
    def self.authenticate
      if File.exists?(File.expand_path('~/.supportbee/credentials'))
        company_name, token = '', ''
        f = File.open(File.expand_path('~/.supportbee/credentials'), 'r') do |i|
          lines = i.readlines
          #
          ## shitty shitty gsubs below
          # needs to be refactored
          company_name = lines.first.split(":").last.gsub("\n", "").gsub(" ", "")
          token = lines.last.split(":").last.gsub("\n", "")
        end
       [ company_name, token]
      else
        p 'Please enter Company Name : '
        company_name = gets.chop
        p 'Please enter Authentication Token :'
        token = gets.chop
        puts %x[mkdir ~/.supportbee] if !File.exists?(File.expand_path('~/.supportbee'))
        f = File.new(File.expand_path("~/.supportbee/credentials"), 'w')
        f.write("company:#{company_name}")
        f.write("token:#{token}")
       [ company_name, token]
      end
    end
  end
end
