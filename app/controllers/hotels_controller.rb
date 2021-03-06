class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]

  # GET /hotels
  # GET /hotels.json
  def index
    @hotels = Hotel.all
  end

  # GET /hotels/1
  # GET /hotels/1.json
  def show
    @hotel = Hotel.find(params[:id])
    @hotel_rooms = @hotel.rooms.order("id DESC").paginate(page: params[:page], per_page: 10)
  end

  # GET /hotels/new
  def new
    @hotel = Hotel.new
    @hotel.address = Address.new
    @chains = Chain.all
    @ratings = [1,2,3,4,5]
  end

  # GET /hotels/1/edit
  def edit
  end

  # POST /hotels
  # POST /hotels.json
  def create
    @hotel = Hotel.new(hotel_params)
    # @hotel[:num_of_rooms] = @hotel.rooms.count
    respond_to do |format|
      if @hotel.save
        create_phone_numbers
        format.html { redirect_to @hotel, notice: 'Hotel was successfully created.' }
        format.json { render :show, status: :created, location: @hotel }
      else
        format.html { render :new }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotels/1
  # PATCH/PUT /hotels/1.json
  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to @hotel, notice: 'Hotel was successfully updated.' }
        format.json { render :show, status: :ok, location: @hotel }
      else
        format.html { render :edit }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotels/1
  # DELETE /hotels/1.json
  def destroy
    @chain_id = @hotel.chain.id
    @hotel.destroy
    respond_to do |format|
      format.html { redirect_to chain_url(@chain_id), notice: 'Hotel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_phone_numbers
    if params['phones'].present?
      phone_arr = params[:phones].split(',')
      phone_arr.each do |phone|
        HotelPhoneNumber.create(phone_number: phone.gsub(/\s+/,''), hotel_id: @hotel.id)
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hotel_params
      # params.fetch(:hotel, {})
      params.require(:hotel).permit(:rating, :num_of_rooms, :email_address, :chain_id, address_attributes: [:street_number, :street_name, :apt_number, :city, :state, :zip])
    end
end
