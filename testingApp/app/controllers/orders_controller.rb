class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /customers/1/orders
  def index
    @customer = Customer.find(params[:customer_id])
    @orders = @customer.orders
  end

  # GET /customers/1/orders/1
  def show
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.find(params[:id])
  end

  # GET /customers/1/orders/new
  def new
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.build
  end

  # POST /customers/1/orders
  def create
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.build(params.require(:order).permit(
        :product, :details
    ))
    if @order.save
        redirect_to customer_order_url(@customer, @order)
    else
        render :action => "new"
    end
  end

  # GET /customers/1/orders/1/edit
  def edit
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.find(params[:id])
  end

  # PUT /customers/1/orders/1
  def update
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.find(params[:id])

    if @order.update_attributes(params.require(:order).permit(
        :product, :details))
      redirect_to customer_order_url(@customer, @order)
    else
        render :action => "edit"
    end
  end

  # DELETE /customers/1/orders/1
  def destroy
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to customer_orders_path(@customer) }
      format.xml { head :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:product, :details, :customer_id)
    end
end
