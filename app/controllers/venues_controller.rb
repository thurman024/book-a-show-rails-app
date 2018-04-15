class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to venue_path(@venue)
    else
      render :new
    end
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue.update(venue_params)
    redirect_to venue_path(@venue)
  end

  def show
    @venue = Venue.find(params[:id])
    @next_show = @venue.next_show.first
  end

  private
  def venue_params
    params.require(:venue).permit(:name, :description)
  end
end
