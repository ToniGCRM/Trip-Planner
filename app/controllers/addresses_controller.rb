class AddressesController < ApplicationController
  before_action :set_location
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  def index
    @address = @location.addresses.all
  end
  def show
    # before_action
  end
  def new
    @address = @location.address.new
  end
  def create
    if @address.save(address_params)
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
    if @address.update
      redirect_to location_addresses_path(@location)
    else
      render :edit
    end
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




