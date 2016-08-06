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

  test "successful book addition" do
    log_in_as(@admin)
    get new_book_path
    assert_template 'books/new'
    assert_difference 'Book.count', 1 do
      post books_url(@book), params: { book: { title: "Me You",
                                                ISBN: "123456AS",
                                                Description: "zxcvbnmasdf",
                                                quantity: 1} }
    end
    assert_not flash.empty?
    assert_redirected_to books_url
  end

end
