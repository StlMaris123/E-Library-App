class LeasesController < ApplicationController
  def create
    @lease = Lease.new(lease_params)
    if  @lease.save
      flash[:success] = "Your request was successfully submitted"
      redirect_to books_url
    end
  end

  def index
    @requested = Lease.requested
    @borrowed = Lease.borrowed
  end
  

  def new
    @lease = Lease.new
  end

  def accept
    @lease = Lease.find(params[:lease_id])
    @lease.update_attribute(:status, params[:status])
    redirect_to leases_url
  end

  def destroy
    @lease = Lease.find(params[:lease_id])
    book = Book.find(@lease.book_id)
  end
  private
  def lease_params
    params.require(:lease).permit(:user_id, :book_id)
  end
end
