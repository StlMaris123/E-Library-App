require 'test_helper'

class BooksEditTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:stella)
  end

  test "unsuccessful book edit" do
    log_in_as(@admin)
    get edit_book_path(@book)
    assert_template 'books/edit'
    patch book_path(@book), params: { book: {
    title:  "",
    ISBN:   123,
    description: "",
    quantity: 0
    }}
assert_template 'documents/edit'
  end
end
