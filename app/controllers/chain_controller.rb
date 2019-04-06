class ChainController < ApplicationController

  def index
    @chains = Chain.all
  end

  def new
    @chain = Chain.new
    @chain.address = Address.new
  end

  def show
    @chain = Chain.find(params[:id])
    @chain_hotels = @chain.hotels
  end

  def create
    @chain = Chain.new(chain_params)
    if @chain.save
      create_emails
      create_phone_numbers
      flash[:notice] = "Chain created successfully."
      redirect_to chain_index_path
    else
      flash[:error] = "Could not create the chain."
      render action: :new
    end
  end

  def edit
    @chain = Chain.find(params[:chain_id])
  end

  def update
    respond_to do |format|
      @chain = Chain.find(params[:chain_id])
      if @chain.update(chain_params)
        format.html { redirect_to chain_show_path, notice: 'Chain was successfully updated.' }
        format.json { render :show, status: :ok, location: @chain }
      else
        format.html { render :edit }
        format.json { render json: @chain.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @chain = Chain.find(params[:id])
    @chain.destroy
    respond_to do |format|
      format.html { redirect_to chain_index_path, notice: 'Chain was successfully destroyed.' }
      format.json { head :no_content }
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
    def set_chain
      @chain = Chain.find(params[:id])
    end

    def chain_params
      params.require(:chain).permit(:name , address_attributes: [:street_number, :street_name, :apt_number, :city, :state, :zip])
    end

end
