class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to bookings_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :venue_owner)
  end
end
