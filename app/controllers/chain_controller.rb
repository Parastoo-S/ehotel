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
      create_emails
      flash[:notice] = "Chain created successfully."
      redirect_to root_path
    else
      flash[:error] = "Could not create the chain."
      render action: :new
    end
  end

  def create_emails
    if params['emails'].present?
      email_arr = params[:emails].split(',')
      binding.pry
      email_arr.each do |email|
        ChainEmail.create(email_address: email, chain_id: @chain.id)
        binding.pry
      end
    end
  end
  private
    def chain_params
      params.require(:chain).permit(:name , address_attributes: [:street_number, :street_name, :apt_number, :city, :state, :zip])
      # params.require(:chain).permit(:name)

    end

end
