class LeasesController < ApplicationController
  def create
    @lease = Lease.new(lease_params)
    if  @lease.save
      flash[:success] = "Your request was successfully submitted"
      redirect books_url
    end
  end

  def index
    @requested = Lease.requested
    @borrowed = Lease.borrowed
  end

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
  private
  def lease_params
    params.require(:lease).permit(:user.id, :book.id)
  end
end
