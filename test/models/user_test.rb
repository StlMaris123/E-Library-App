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

end
