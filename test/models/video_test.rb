require "test_helper"

class VideoTest < ActiveSupport::TestCase
  test "should not save video without title" do
    video = Video.new
    video.channel = channels(:one)
    assert_not video.save, "Saved the video without a title"
  end
end
