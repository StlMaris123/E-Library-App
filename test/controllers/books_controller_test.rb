require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @book = books(:one)
  end
  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should get show" do
    get book_url(@book)
    assert_response :success
  end

end
