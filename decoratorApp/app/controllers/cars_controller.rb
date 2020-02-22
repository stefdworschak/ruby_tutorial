require 'car_decorator'
class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.all
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new()
    @car.firstname = params[:car][:firstname]
    @car.lastname = params[:car][:lastname]
    @car.color = params[:car][:color]
    @car.manufacturer = params[:car][:manufacturer]
    p params[:cost].to_i
    myCar = BasicCar.new(params[:car][:cost].to_i, @car.manufacturer, @car.color)

    # add the extra features to the new car
    if params[:car][:windows].to_s.length > 0 then
    myCar = ElectricWindowsDecorator.new(myCar)
    end
    if params[:car][:mirror].to_s.length > 0 then
    myCar = MirrorDecorator.new(myCar)
    end
    if params[:car][:psensor].to_s.length > 0 then
    myCar = ParkingSensorDecorator.new(myCar)
    end
    ## populate the cost and the description details
    @car.cost = myCar.cost
    @car.description = myCar.details

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:firstname, :lastname, :manufacturer, :cost, :description, :color)
    end
end
