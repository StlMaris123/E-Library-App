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

  test "valid signup information " do
    get signup_url
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name: "stella",
                                            email: "ste@gmail.com",
                                            password: "rainbow",
                                            password_confirmation: "rainbow"}
    end
    assert_template 'users/show'
  end
 end
