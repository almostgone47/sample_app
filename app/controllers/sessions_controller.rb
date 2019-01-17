class SessionsController < ApplicationController
  protect_from_forgery with: :null_session
  include SessionsHelper
  
  def new
  	
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		login(user)
  		flash[:success] = "You're logged in."
  		redirect_to user
  	else
  		flash.now[:danger] = 'Invalid email/password combination'
  		render 'new'
  	end
  end

  def destroy
    logout
    redirect_to root_path
    flash[:success] = "You've been logged out."
  end

end
