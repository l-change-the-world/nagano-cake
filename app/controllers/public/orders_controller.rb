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
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    @order.save
    #order_itmeに保存
    current_member.shopping_cart_items.each do |shopping_cart_item|#カート内商品を1つずつ取り出しループ
      @order_item = OrderItem.new#初期化宣言
      @order_item.order_id =  @order.id#order注文idを紐付けておく
      @order_item.item_id = shopping_cart_item.item_id#カート内商品idを注文商品idに代入
      @order_item.quantity = shopping_cart_item.quantity#カート内商品の個数を注文商品の個数に代入
      @order_item.price = (shopping_cart_item.item.price_excluding_tax*1.1).floor#消費税込みに計算して代入
      @order_item.save#注文商品を保存
    end
    current_member.shopping_cart_items.destroy_all#カートの中身を削除
    redirect_to complete_orders_path
  end

  def confirm #注文情報入力確認画面
    @total = 0
    @shopping_cart_items = current_member.shopping_cart_items.all
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_member.postal_code
      @order.address = current_member.address
      @order.name = current_member.last_name + current_member.first_name
    elsif params[:order][:select_address] == "1"
      ship = ShippingAddresses.find(params[:order][:member_id])#orderのmember_id(=カラム)でアドレス(帳)を選び、そのデータ送る
      @order.postal_code = ship.postal_code
      @order.address = ship.address
      @order.name = ship.name
    elsif params[:order][:select_address] == "2"
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
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_fe, :member_id, :total_payment_amount, :status)
  end

end
