class AddressController < ApplicationController

  def index
  end

  def new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      flash[:notice] = "Address created successfully."
    else
      flash[:error] = "Could not create the address."
    end
  end



  private
    def address_params
      params.require(:address).permit(:street_number, :street_name, :apt_number, :city, :state, :zip)
    end
end
