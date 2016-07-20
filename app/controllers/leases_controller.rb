class LeasesController < ApplicationController

  def new
    @lease = Lease.new
  end

  def request
    @lease = Lease.new
    # if @book && @user != nil
    #   #
    #   flash[:success] = "Your request was successfully made"
    # else
    #   flash[:danger] = "Error processing your request"
    # end
  end
  def book_status
    @book = Book.find(params[:id])
    @book.update_attribute(:status, params[:status])
    redirect_to books_url
  end
end
