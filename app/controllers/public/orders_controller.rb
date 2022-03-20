class Public::OrdersController < ApplicationController
  def index
    @orders = current_customer.orders.page(params[:page])
  end

  def show
  end

  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
  end

  def create
    @order = Order.new(order_params)
    @order.save
  end

  def log
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:name, :post_code, :address, :postage, :total_price, :payment_method)
  end
end
