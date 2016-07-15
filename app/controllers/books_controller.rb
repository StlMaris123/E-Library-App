class BooksController < ApplicationController
  def new
  end

  def index
    @books = Book.all
  end

  def edit
  end

  def show

  end
end
