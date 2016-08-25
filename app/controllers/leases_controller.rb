class LeasesController < ApplicationController
  before_action :admin_user?, only: [:accept, :destroy]
  def create
    lease = Lease.new(lease_params)

    begin
      if lease.save
        flash[:success] = "Your request was successfully submitted"
        redirect_to current_user
      else
        flash[:alert] = "Request unsuccessful"
        redirect_to current_user
      end
    rescue
      flash[:alert] = "You have already requested for this book"
      redirect_to current_user
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
    due_date = 14.days.from_now
    # charge_fee = 50 * lease.over_due
    @lease.update_attributes(status: 'borrowed', due_date: due_date, start_date: Time.zone.now)
    @book = Book.find(@lease.book_id)
    @book.update_attribute(:quantity, @book.quantity-1)
    redirect_to leases_url
  end


  def destroy
    @lease = Lease.find(params[:id]).destroy
    flash[:primary] = "Book returned"
    @book = Book.find(@lease.book_id)
    @book.update_attribute(:quantity, @book.quantity+1 )
    redirect_to leases_path
  end
  private
  def lease_params
    params.require(:lease).permit(:user_id, :book_id)
  end
end
