class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if request.env["omniauth.auth"]
      @user = User.find_or_create_by(username: request.env["omniauth.auth"]["info"]["first_name"])
      redirect_to bookings_path
    else
      @user = User.find_by(name: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
       session[:user_id] = @user.id
       redirect_to bookings_path
      else
       redirect_to login_path
      end
    end
  end

  def destroy
    session.delete :user_id if session[:user_id]
    redirect_to root_path
  end
end
