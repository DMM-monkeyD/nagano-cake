class Public::OrdersController < ApplicationController
  def index
    @orders = current_customer.orders.page(params[:page])
  end

  def show
    @order=current_customer.orders.find(params[:id])
  end

  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id

    if @order.save
      flash[:notice] = "注文を受け付けました"
      if params[:order][:select_address] == "2"
        @delivery = ShippingAddress.new
        @delivery.customer_id = current_customer.id
        @delivery.name = @order.name
        @delivery.post_code = @order.post_code
        @delivery.address = @order.address
        @delivery.save
      end
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        @orderdetail = OrderItem.new
        @orderdetail.item_id = cart_item.item_id
        @orderdetail.order_id = @order.id
        @orderdetail.tax_price = cart_item.item.add_tax_price
        @orderdetail.quantity = cart_item.quantity
        @orderdetail.save
      end
      @cart_items.destroy_all
      redirect_to complete_orders_path
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def log
    @cart_items = current_customer.cart_items.all
    @postage = 800
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @total_price = @total + @postage
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      @delivery = ShippingAddress.find(params[:order][:shipping_address_id])
      @order.post_code = @delivery.post_code
      @order.address = @delivery.address
      @order.name = @delivery.name
    elsif params[:order][:select_address] == "2"
    else
      flash[:notice] = "配送先を選択してください"
      @order = Order.new(order_params)
      render :new
    end
  end

  def back
    @order = Order.new

    render :new
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :name, :post_code, :address, :postage, :total_price, :payment_method)
  end
end
