class BookingsController < ApplicationController
  before_action :require_login
  before_action :venue_owner?
  skip_before_action :venue_owner?, only: [:index, :show]

  def index
    if params[:venue_id]
      @venue = Venue.find_by(id: params[:venue_id])
      if @venue.nil?
        flash[:message] = "Venue not found"
        redirect_to venues_path
      else
        @bookings = @venue.bookings
      end
    elsif params[:band_id]
      @band = Band.find_by(id: params[:band_id])
      if @band.nil?
        flash[:message] = "Band not found"
        redirect_to bands_path
      else
        @bookings = @band.shows
      end
    else
      @bookings = Booking.all
    end
  end

  def show
    if params[:venue_id]
      @venue = Venue.find_by(id: params[:venue_id])
      @booking = @venue.bookings.find_by(id: params[:id])
      if @booking.nil?
        flash[:message] = "Booking not found"
        redirect_to venue_bookings_path
      end
    elsif params[:band_id]
      @band = Band.find_by(id: params[:band_id])
      @booking = @band.shows.find_by(id: params[:id])
      if @booking.nil?
        flash[:message]  = "Booking not found"
        redirect_to band_bookings_path
      end
    else
      @booking = Booking.find(params[:id])
    end
  end

  def new
    @booking = Booking.new(band_id: params[:band_id], venue_id: params[:venue_id])
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.delete
    flash[:message] = "Booking successfully deleted."
    redirect_to bookings_path
  end

  private
  def booking_params
    params.require(:booking).permit(:band_id, :venue_id, :showtime)
  end

end
