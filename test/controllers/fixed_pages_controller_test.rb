require 'test_helper'

class FixedPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get fixed_pages_home_url
    assert_response :success
  end

  test "should get faq" do
    get fixed_pages_faq_url
    assert_response :success
  end

  test "should get about" do
    get fixed_pages_about_url
    assert_response :success
  end

  test "should get contact" do
    get fixed_pages_contact_url
    assert_response :success
  end

end
