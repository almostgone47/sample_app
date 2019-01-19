class SessionsController < ApplicationController
  protect_from_forgery with: :null_session
  include SessionsHelper
  
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		if user.activated?
        login(user)
        params[:session][:remember_me] = '1' ? remember(user) : forget(user)
    		flash[:success] = "You're logged in."
    		redirect_back_or user
  	  else
        message = "Account not activated."
        message += "Check your email for validation link."
  		  flash.now[:warning] = message
  		  redirect_to root_url
      end
  	else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_path
    flash[:success] = "You've been logged out."
  end

end
