class BooksController < ApplicationController
  before_action :admin_user, only: [:create, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index]
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      flash[:success] = "Book was successfully added"
      redirect_to books_path 
    else
      render 'new'
    end
  end


  def edit
    @book = admin_user.books.find(params[:id])
  end


  def update
    @book =  Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:success] = "Book was successfully updated"
      redirect_to books_url
    else
      render 'edit'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:success] = "book successfully deleted"
    redirect_to books_url
  end

private
def book_params
  params.require(:book).permit(:ISBN, :title, 
                               :description, :quantity)
end
def admin_user
  redirect_to(books_url) unless current_user.admin?
end
end
