require 'minitest/spec'
require 'minitest/autorun'

require 'supportbee'

describe Supportbee::Base do
  it "should be an instance of Supportbee::base class" do
    Supportbee::Base.new("qaKDJHH0ASdWD_u-v36d", 'josh').must_be_instance_of Supportbee::Base
  end

  it "should list all the tickets of all projects for 'supportbee tickets'"
  it "should list tickets foo group tickets for 'supportbee tickets group:foo'"
  it "should list tickets satish and rohit tickets for 'supportbee tickets agent:sathish,rohit'"
  it "should list high and open tickets for 'supportbee tickets label:high,open'"
  it "should list 'high,open' tickets of 'satish' agent of group foo for 'supportbee tickets group:foo agent:satish label:high,open'"
  it "should give warning message as 'invalid option.please check supportbee --help' for 'supportbee tickets group foo'" 
  it "should give warning message as 'invalid option. please check supportbee --help' for 'supportbee tickets group'" 
  it "should give warning message as 'invalid option. please check supportbee --help' for 'supportbee tickets agent:satishrohit'" 
  it "should give warning message as 'invalid option. please check supportbee --help' for 'supportbee tickets agent satishrohit'" 
  it "should give warning message as 'invalid option. please check supportbee --help' for 'supportbee tickets label'" 
  it "should give warning message as 'invalid option. please check supportbee --help' for 'supportbee tickets label high'" 
end
