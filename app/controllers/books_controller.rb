class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book was successfully added"
      redirect_to @user 
    else
      render 'new'
    end
  end


  def edit
    @book = Book.find_by(params[:id])
  end

  def destroy
  end

  def update
    @book = Book.find_by(params[:id])
    if @book.update_attributes(book_params)
      flash[:success] = "Book was successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @book = Book.find_by(params[:id])
  end
end
private
def book_params
  params.require(:book).permit(:ISBN, :title, 
                               :description, :quantity)
end

