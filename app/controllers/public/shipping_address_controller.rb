class Public::ShippingAddressController < ApplicationController
  def index
    @shipping_address = ShippingAddress.new  
  end

　def create
　  @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.save
    redirect_to shipping_addresses_path
　end
  
  def edit
  end
  
  def destroy
  end
  
  def update
  end

private

  def shipping_address_params
    params.require(:shipping_address).permit(:post_code, :address, :name )
  end
end
