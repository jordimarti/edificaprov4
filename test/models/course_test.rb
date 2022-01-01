require "test_helper"

class CourseTest < ActiveSupport::TestCase
  test "should not save course without title" do
    course = Course.new
    course.channel = channels(:one)
    assert_not course.save, "Saved the course without a title"
  end
end
