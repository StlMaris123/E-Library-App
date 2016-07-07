require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information " do
    get signup_url
    assert_no_difference 'User.count' do
      post users_path user: {name: "",
                             email: "ste.gmail.com",
                             password: "bow",
                             password_confirmation: "rain"}
    end
    assert_template 'users/new'
  end
 end
