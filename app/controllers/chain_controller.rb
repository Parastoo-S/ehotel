class ChainController < ApplicationController

  def index
  end

  def new
    @chain = Chain.new
    @address = Address.new
  end

  def create
    @chain = Chain.new(chain_params)
    @address = Address.create(params[:address])
    if @chain.save
      flash[:notice] = "Chain created successfully."
    else
      flash[:error] = "Could not create the chain."
    end
  end

  private
    def chain_params
      params.require(:chain).permit(:name)
    end

end
