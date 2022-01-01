require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "has first name" do
    assert_equal "Jordi", users(:jordi).first_name
  end

  test "can update first name" do
    users(:jordi).update(first_name: "Martimediatic")
    assert_equal "Martimediatic", users(:jordi).first_name
  end
end
