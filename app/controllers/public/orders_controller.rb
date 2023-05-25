class Public::OrdersController < ApplicationController
  before_action :authenticate_member!
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @shopping_cart_items = current_member.shopping_cart_items
    @order.shopping_cost = 800
    @total = 0
    if params[:order][:address_select] == "membercart_items_address"
      @order.postal_code = current_member.postal_code
      @order.address = current_member.address
      @order.name = current_member.last_name + current_member.first_name
    elsif params[:order][:address_select] == "address"
      address = ShippingAddress.find_by(params[:order][:address_id])
      if address.present?
        @order.postal_code = address.postal_code
        @order.address = address.address
        @order.name = address.name
      else
        redirect_to request.referer
      end
    end
  end


  def thanks
  end

  def create
    order = current_member.orders.new(order_params)
    order.status = 0
    order.save
    current_member.shopping_cart_items.each do |shopping_cart_item|
      order_item = OrderItems.new(
        order_id: order.id,
        item_id: shopping_cart_item.item.id,
        price: shopping_cart_item.item.price_excluding_tax,
        quantity: shopping_cart_item.quantity,
        making_status: 0)
    order_item.save
    shopping_cart_item.destroy
    end
  redirect_to orders_thanks_path

  end

  def index
    @order = current_member.orders
    
  end

  def show
    @order = Order.find(params[:id])
    @total = 0
  end

private

  def order_params
    params.require(:order).permit(:member_id, :total_payment_amount, :shopping_cost, :payment_method, :name, :address, :shipping_fee, :postal_code, :status, :image)
  end
end