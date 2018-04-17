class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  def venue_owner?
    if !current_user.venue_owner
      flash[:message] = "You must be registered as a venue owner to perform this action"
      redirect_to venues_path
    end
  end
end
