class DeliveryAddressesController < ApplicationController
  before_action :set_delivery_address, only: [:show, :edit, :update, :destroy]

  # GET /delivery_addresses
  # GET /delivery_addresses.json
  def index
    @delivery_addresses = DeliveryAddress.all
  end

  # GET /delivery_addresses/1
  # GET /delivery_addresses/1.json
  def show
  end

  # GET /delivery_addresses/new
  def new
    @delivery_address = DeliveryAddress.new
  end

  # GET /delivery_addresses/1/edit
  def edit
  end

  # POST /delivery_addresses
  # POST /delivery_addresses.json
  def create
    @delivery_address = DeliveryAddress.new(delivery_address_params)

    respond_to do |format|
      if @delivery_address.save
        format.html { redirect_to @delivery_address, notice: 'Delivery address was successfully created.' }
        format.json { render :show, status: :created, location: @delivery_address }
      else
        format.html { render :new }
        format.json { render json: @delivery_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /delivery_addresses/1
  # PATCH/PUT /delivery_addresses/1.json
  def update
    respond_to do |format|
      if @delivery_address.update(delivery_address_params)
        format.html { redirect_to @delivery_address, notice: 'Delivery address was successfully updated.' }
        format.json { render :show, status: :ok, location: @delivery_address }
      else
        format.html { render :edit }
        format.json { render json: @delivery_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delivery_addresses/1
  # DELETE /delivery_addresses/1.json
  def destroy
    @delivery_address.destroy
    respond_to do |format|
      format.html { redirect_to delivery_addresses_url, notice: 'Delivery address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery_address
      @delivery_address = DeliveryAddress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def delivery_address_params
      params.require(:delivery_address).permit(:address, :city, :postal_code, :province_id)
    end
end
