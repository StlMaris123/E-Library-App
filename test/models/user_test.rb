require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "stella", email: "stellanajage@gmail.com",
                     password: "rainbow", password_confirmation: "rainbow", mobile_number: "0710864761")
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

  test "email format should be valid" do
    valid_addresses = %w[stel@gmail.com StE@gmail.co T_S-e@gmail.c
                     ste@gamil.co.m ste+maris@gmail.com]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  test "invalid email format should be rejected" do
    invalid_addresses = %w[ste@gmail_c.o ste@gma,co ste@gmail ste.co.ke ste@gmail+co]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect}should be invalid"
    end
  end

  test "email address should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end
  test "minimum password length should be 6" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end
end
