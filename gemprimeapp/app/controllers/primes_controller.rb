class PrimesController < ApplicationController
  before_action :set_prime, only: [:show, :edit, :update, :destroy]

  # GET /primes
  # GET /primes.json
  def index
    @primes = Prime.all
  end

      # Checks if entered number is a prime
    def isprime
      @input1 = params[:search_string]
      @result = IsPrime.runcheck(@input1.to_i)
    end

  # GET /primes/1
  # GET /primes/1.json
  def show
  end

  # GET /primes/new
  def new
    @prime = Prime.new
  end

  # GET /primes/1/edit
  def edit
  end

  # POST /primes
  # POST /primes.json
  def create
    @prime = Prime.new(prime_params)

    respond_to do |format|
      if @prime.save
        format.html { redirect_to @prime, notice: 'Prime was successfully created.' }
        format.json { render :show, status: :created, location: @prime }
      else
        format.html { render :new }
        format.json { render json: @prime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /primes/1
  # PATCH/PUT /primes/1.json
  def update
    respond_to do |format|
      if @prime.update(prime_params)
        format.html { redirect_to @prime, notice: 'Prime was successfully updated.' }
        format.json { render :show, status: :ok, location: @prime }
      else
        format.html { render :edit }
        format.json { render json: @prime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /primes/1
  # DELETE /primes/1.json
  def destroy
    @prime.destroy
    respond_to do |format|
      format.html { redirect_to primes_url, notice: 'Prime was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prime
      @prime = Prime.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prime_params
      params.require(:prime).permit(:primenum)
    end



end
