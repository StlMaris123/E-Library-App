class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Karibu, learn it live it"
      redirect_to @user
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
      #handle a successful update
    else
      render 'edit'
    end
  end
private
def user_params
  params.require(:user).permit(:name, :email, :password,
                             :password_confirmation)
end
end
