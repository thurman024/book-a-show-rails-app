class BookingsController < ApplicationController
  before_action :require_login
  # before_action :venue_owner?
  # skip_before_action :venue_owner?, only: [:index, :show]
  before_action :set_booking, only: [:edit, :update, :destroy]

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
    respond_to do |format|
      format.json {render json: @bookings}
      format.html {render :index}
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
      set_booking
    end
  end

  def new
    # if venue, venue_owner?
    @booking = Booking.new(band_id: params[:band_id], venue_id: params[:venue_id])
  end

  def create
    # raise params.inspect
    if venue_owner?
      @booking = Booking.new(booking_params)
      if @booking.save
        redirect_to booking_path(@booking)
      else
        render :new
      end
    else
      flash[:message] = "You must be registered as the venue owner to perform this action"
      redirect_to new_booking_path
    end
  end

  def create_json
    if venue_owner?
      @booking = Booking.new(booking_params)
      if @booking.save
        # redirect_to booking_path(@booking)
        render json: @booking
      else
        render :new
      end
    else
      flash[:message] = "You can only create bookings at your venue"
      render '/venues/show'
    end
  end

  # def booking_data
  #   booking = Booking.find(params[:id])
  #   render json: booking.to_json(only: [:showtime],
  #                                 include: [:venue, :band])
  # end

  def edit

  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.delete
    flash[:message] = "Booking successfully deleted."
    redirect_to bookings_path
  end

  private
  def booking_params
    params.require(:booking).permit(:band_id, :venue_id, :showtime)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
