class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @member = @order.member
    @order_items = @order.order_items
    @total = 0
  end

  def update
    @order = Order.find(params[:id])
    @order_item = @order.order_items
    if @order.update(order_params)
      @order_item.update_all(production_status: 1) if @order.status == "paid_check"
      redirect_to admin_order_path(@order)
      else
      redirect_to admin_order_path(@order)
    end
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end
