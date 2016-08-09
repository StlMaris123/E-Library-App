require 'test_helper'

class BooksEditTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:stella)
  end

  test "unsuccessful book edit" do
    log_in_as(@admin)
    get edit_book_path(@book)
    assert_template 'books/edit'
    title =
    ISBN  =
    description =
    quantity = 
    patch book_path(@document), params: { book: {  } }
    assert_not flash.empty?
    @book.reload
    assert_equal @book.title, title
    assert_equal @book.ISBN, ISBN
    assert_equal @book.description, description
    asssert_equal @book.department

  end
end
