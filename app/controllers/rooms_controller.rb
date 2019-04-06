class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
    # @room.hotel_id = (params[:hotel_id]).to_i
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)
    respond_to do |format|
      if @room.save
        if params[:hotel_id].present?
          @room.hotel = params[:hotel_id]
        end
        create_amenity
        create_damage
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @hotel = @room.hotel.id
    @room.destroy
    respond_to do |format|
      format.html { redirect_to hotel_url(@hotel), notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_amenity
    if params['amenities'].present?
      amenities_arr = params[:amenities].split(',')
      amenities_arr.each do |amenity|
        Amenity.create(amenity_name: amenity.gsub(/\s+/,''), room_id: @room.id)
      end
    end
  end

  def create_damage
    if params['damages'].present?
      damages_arr = params[:damages].split(',')
      damages_arr.each do |damage|
        Damage.create(damage_name: damage.gsub(/\s+/,''), room_id: @room.id)
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.fetch(:room).permit(:price, :capacity, :extendible, :occupied, :status, :view, :hotel_id, amenity_attributes: [:amenity_name, :room_id], damage_attributes: [:damage_name, :room_id])
    end
end
