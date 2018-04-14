class BookingsController < ApplicationController
  def index
    if params[:venue_id]
      @venue = Venue.find_by(id: params[:venue_id])
      redirect_to venues_path, alert: "Venue not found" if @venue.nil?
      @bookings = @venue.bookings
    elsif params[:band_id]
      @band = Band.find_by(id: params[:band_id])
      redirect_to bands_path, alert: "Band not found" if @band.nil?
      @bookings = @band.shows
    else
      @bookings = Booking.all
    end
  end


end
