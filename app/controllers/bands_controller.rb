class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_path(@band)
    else
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
  end

  private
  def band_params
    params.require(:band).permit(:name, :description, :rate)
  end
end
