class UsersController < ApplicationController
  before_action :admin_user, only: [:index, :destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      redirect_to root_url
    end
  end

  def destroy
    @user = Movie.find(params[:id])
    @user.destroy
    redirect_to root_url, notice: "User was successfully destroyed"
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :dob, :address, :email, :phone_number, :password, :password_confirmation)
    end

    def admin_user
      redirect_to root_url unless is_admin?
    end
end
