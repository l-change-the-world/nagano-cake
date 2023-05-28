class Public::ShippingAddressesController < ApplicationController
before_action :authenticate_member!

  def new
    @shipping_address = ShippingAddress.new
  end

  def index
    @shipping_address = ShippingAddress.new
    @shipping_addresses = ShippingAddress.where(member_id:current_member.id)
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.member_id = current_member.id
    if @shipping_address.save
      redirect_to request.referer
    else
      render :index
    end
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_params)
      redirect_to '/shipping_addresses'
    else
      render :edit
    end
  end

  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.destroy
    redirect_to '/shipping_addresses'
  end
  
  
  private
  
  def shipping_address_params
    params.require(:shipping_address).permit(:postal_code, :address, :name)
  end
end