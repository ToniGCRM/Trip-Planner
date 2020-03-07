class AddressesController < ApplicationController
  before_action :set_location
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  def index
    @addresses = @location.address.all
  end
  def show
    # before_action
  end
  def new
    @address = @location.address.new
  end
  def create
    @address = @location.address.new(address_params)
    if @address.save
      # render show page
      redirect_to location_addresses_path(@location)
    else
      render :new
    end
  end
  def edit
    # before_action
  end
  def update
    if @address.update(address_params)
      redirect_to location_addresses_path(@location)
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to location_addresses_path(@location)
  end
  private
  def set_location
    @location = Location.find(params[:location_id])
  end
  def set_address
    @address = Address.find(params[:id])
  end
  def address_params
    params.require(:address).permit(:city, :state, :zip)
  end
end




