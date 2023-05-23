class Public::OrdersController < ApplicationController
  before_action :authenticate_member!
  def new #注文情報入力画面
    @order = Order.new
  end
  
  def index
  end
  
  def show
  end
  
  def create
  end
  
  def confirm #注文情報入力確認画面
    @order = Order.new(order_params)
    if params[:order][:select_address] == 0
      @order.postal_code = current_member.postal_code
      @order.address = current_member.address
      @order.name = current_member.last_name + current_member.first_name
    elsif params[:order][:select_address] == 1
      ship = ShippingAddresses.find(params[:order][:member_id])#orderのmember_id(=カラム)でアドレス(帳)を選び、そのデータ送る
      @order.postal_code = ship.postal_code
      @order.address = ship.address
      @order.name = ship.name
    elsif params[:order][:select_address] == 2
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
　　else
      render 'new'
    end
  end
  
  def complete
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
  
end
