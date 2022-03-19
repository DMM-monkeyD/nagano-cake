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

  def log
  end

  def complete
  end
end
