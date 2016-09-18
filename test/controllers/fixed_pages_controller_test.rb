require 'test_helper'

class FixedPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @common_title ="| Learn it live it" 
  end
  
  test "should get home" do
    get root_url
    assert_response :success
    assert_select "title", "Home #{@common_title}"
  end

  test "should get faq" do
    get faq_url
    assert_response :success
    assert_select "title", "FAQ #{@common_title}"
  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", "About #{@common_title}"
  end


end
