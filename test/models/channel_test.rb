require "test_helper"

class ChannelTest < ActiveSupport::TestCase
  test "should not save channel without name" do
    channel = Channel.new
    channel.account = accounts(:one)
    assert_not channel.save, "Saved the channel without a name"
  end
end
