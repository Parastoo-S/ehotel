class ChainController < ApplicationController

  def index
  end

  def new
    @chain = Chain.new
    @chain.address = Address.new
  end

  def create
    @chain = Chain.new(chain_params)
    if @chain.save
      flash[:notice] = "Chain created successfully."
      redirect_to root_path
    else
      flash[:error] = "Could not create the chain."
      render action: :new
    end
  end

  private
    def chain_params
      params.require(:chain).permit(:name , address_attributes: [:street_number, :street_name, :apt_number, :city, :state, :zip])
      # params.require(:chain).permit(:name)

    end

end
