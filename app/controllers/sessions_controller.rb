class SessionsController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]
  
  def new
  end

  def create
  	username = params[:user][:username]
  	password = params[:user][:password]
  	puts "-------------------#{password}-------------------------------"
  	user = User.find_by_username(username)
  	if user.authenticate(password.to_s)
  		session[:user_id] = user.id
  		redirect_to root_path , notice: "Logged in successfully"
  	else
  		redirect_to login_path , alert: "INVALID USER"
  	end
  end

  def destroy
  	# session.destroy(:user_id)
  	reset_session
  	redirect_to login_path , notice: "successful logout"
  end
end
