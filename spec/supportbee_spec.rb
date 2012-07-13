require 'minitest/spec'
require 'minitest/autorun'

require 'supportbee'

describe Supportbee::Base do
  it "should be an instance of Supportbee::base class" do
    Supportbee::Base.new("qaKDJHH0ASdWD_u-v36d", 'josh').must_be_instance_of Supportbee::Base
  end
end
