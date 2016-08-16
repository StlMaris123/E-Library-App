require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @book = books(:one)
    @admin = users(:stella)
    @user = users(:stella)
  end
  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should get index" do
    log_in_as(@user)
    get books_url(@books)
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@dmin)
    get edit_book_url(@book)
    assert_response :success
  end

  test "should get show" do
    log_in_as(@user)
    get book_url(@book)
    assert_response :success
  end

end
