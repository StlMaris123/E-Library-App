require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:stella)
  end
  test "should get new" do
    get login_url
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user), id: @user
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  test "should redirect update when not logged in" do
    patch user_path(@user), id: @user, user: { name: @user.name, email: @user.email }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

end
