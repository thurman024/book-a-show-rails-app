class StaticController < ApplicationController

  def welcome
    if current_user
      redirect_to bookings_path
    end
  end

end
