class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @order_items = @order.order_items.all

    is_updated =true
    if @order_item.update(order_item_params)
       @order.update(status: 2) if @order_item.production_status == "production"

        @order_items.each do |order_item|
          if order_item.production_status != "complete"
            is_updated = false
          end
        end
       @order.update(status: 3) if is_updated
       redirect_to admin_order_path(@order)
      else
       redirect_to admin_order_path(@order)
    end
  end

  private
  def order_item_params
    params.require(:order_item).permit(:production_status)
  end
end
