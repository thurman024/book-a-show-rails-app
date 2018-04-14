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

  def show
    if params[:venue_id]
      @venue = Venue.find_by(id: params[:venue_id])
      @booking = @venue.bookings.find_by(id: params[:id])
      if @booking.nil?
        redirect_to venue_bookings_path, alert: "Booking not found"
      end
    elsif params[:band_id]
      @band = Band.find_by(id: params[:band_id])
      @booking = @band.shows.find_by(id: params[:id])
      if @booking.nil?
        redirect_to band_bookings_path, alert: "Booking not found"
      end
    else
      @booking = Booking.find(params[:id])
    end
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:band_id, :venue_id, :showtime)
  end

end
