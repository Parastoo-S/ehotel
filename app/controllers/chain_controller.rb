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
      create_phone_numbers
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
      email_arr.each do |email|
        ChainEmail.create(email_address: email.gsub(/\s+/,''), chain_id: @chain.id)
      end
    end
  end

  def create_phone_numbers
    if params['phones'].present?
      phone_arr = params[:phones].split(',')
      phone_arr.each do |phone|
        ChainPhoneNumber.create(phone_number: phone.gsub(/\s+/,''), chain_id: @chain.id)
      end
    end
  end

  private
    def chain_params
      params.require(:chain).permit(:name , address_attributes: [:street_number, :street_name, :apt_number, :city, :state, :zip])
      # params.require(:chain).permit(:name)

    end

end
