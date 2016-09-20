class UsersController < ApplicationController
  # before_action :check_captcha, only: [:create]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
    @books = Book.where(available: true )
    @books = Book.search(params[:search]) if params[:search]
    @borrowed = @user.leases.borrowed 
  end

  def create 
    @user = User.new(user_params)
    puts @user
    puts @user.valid?
    if @user.save
      @user.send_activation_email
      flash[:primary] = "Please check your email to activate your account"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :mobile_number)
  end
  #confirms a logged in user
  def logged_in_user
    unless logged_in?
      store_location
      flash[:alert] = "You have to log in first!"
      redirect_to login_url
    end
  end
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.present? && current_user.admin?
  end
  # def check_captcha
  #   unless verify_recaptcha
  #     render 'new'
  #   end
  # end
end
