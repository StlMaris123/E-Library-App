require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:stella)
    @other_user = users(:boris)
  end

  test "should redirect index when not logged in" do
    get users_url
    assert_redirected_to login_url
  end

  test "should get new" do
    get new_user_url 
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
  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user), id: @user
    assert flash.empty?
    assert_redirected_to root_url
end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch user_path(@user), id: @user, user: { name: @user.name, email: @user.email }
    assert flash.empty?
    assert_redirected_to root_url
  end
end
