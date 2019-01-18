class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  include SessionsHelper
  
  def index
    @users = User.paginate(page: params[:page])
  end

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
    session[:current_user_id] = "blar blar blar blar!!!" 
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      login(@user)
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
  	else
  		flash.now[:danger] = "Signup was unsuccessful!"
  		render :new
  	end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Your changes have been saved!"
      redirect_to @user
    else
      flash.now[:danger] = "You changes were not saved, please try again."
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_path
  end

  private

	  def user_params
	  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
	  end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
