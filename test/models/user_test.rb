require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "stella", email: "stellanajage@gmail.com")
 end
  test "user should be valid" do
    assert @user.valid?
  end

test "User's name should be present" do
  @user.name = ""
  assert_not @user.valid?
end
test "User's email should be present" do
  @user.email = ""
  assert_not @user.valid?
end

test "maximum name length should be 50" do
  @user.name = "b" * 51
  assert_not @user.valid?
end
test "maximum email length should be 250" do
  @user.email = "b" * 241 + "@gmail.com"
  end
end
