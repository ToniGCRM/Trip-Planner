class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :set_trip
  
  def index
    @location = @trip.locations.all 
  end

  def show
  end

  def new
    @location = @trip.locations.new
  end

  def create
    @location = @trip.locations.new(location_params)
    if @location.save
      redirect_to location_path
    else
      render :new
    end
  end


  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to location_path
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to location_path
  end
  
  private
  def set_trip
    @trip = trip.find(params[:parent_id])
  end

  def set_location
    @location = @trip.locations.find(params[:id])
  end
  

  def location_params
    params.require(:location).permit(:name, :description)
  end
end
