require 'test_helper'

class BooksNewTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:stella)
  end
  test "unsuccessful book addition" do
    log_in_as(@admin)
    get new_book_path
    assert_template 'books/new'
    assert_no_difference 'Book.count' do
    post books_url(@book), params: { book: { title: "",
                                      ISBN: "",
                                      description: "",
                                      quantity: ""
    } }
    end
    assert_template 'books/new'
  end

end
