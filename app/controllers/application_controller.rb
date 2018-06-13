class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  def venue_owner?
    venue = Venue.find_by(id: params[:booking][:venue_id])
    current_user.venue_id == venue.id
  end
end
