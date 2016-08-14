require 'test_helper'

class BooksSearchTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:stella)
    @book = books(:one)
  end
  test "search bar should return books by title" do
    log_in_as(@user)
    get books_path, params: {"search" => {:title => @book.title}}
    assert_response :success
  end
end
