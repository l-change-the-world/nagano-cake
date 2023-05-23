class Public::ShoppingCartItemsController < ApplicationController
  
  def index
    @shopping_cart_items = current_member.shopping_cart_items.all
  end
  
  def create
    @shopping_cart_item = current_member.shopping_cart_items.new(shopping_cart_item_params)
    # もしカート内に「同じ商品」がある場合は、「数量を追加」し更新・保存する
    if current_member.shopping_cart_items.find_by(item_id: params[:shopping_cart_item][:item_id]).present?
      # 元々カート内にあるもの「item_id」
      # 追加するもの「params[:shopping_cart_item][:item_id]」
      shopping_cart_item = current_member.shopping_cart_items.find_by(item_id: params[:shopping_cart_item][:item_id])
      shopping_cart_item.quantity += params[:shopping_cart_item][:quantity].to_i
      # shopping_cart_item.quantityに追加したparams[:shopping_cart_item][:quantity]を加える（to_iで数字として扱う）
      shopping_cart_item.save
      redirect_to shopping_cart_items_path
      # もしカート内に「同じ商品」がない場合は、通常の保存処理
    elsif @shopping_cart_item.save
      @shopping_cart_items = current_member.shopping_cart_items.all
      render 'index'
      # 保存できなかった場合
    else
      render 'index'
    end
      
  end
  
  def update
    shopping_cart_items = ShoppingCartItem.find(params[:id])
    shopping_cart_items.update(shopping_cart_item_params)
    @shopping_cart_items = current_member.shopping_cart_items.all
    redirect_to shopping_cart_items_path
  end
  
  def destroy
    shopping_cart_item = ShoppingCartItem.find(params[:id])
    shopping_cart_item.destroy
    @shopping_cart_items = ShoppingCartItem.all
    render 'index'
  end
  
  def destroy_all
    shopping_cart_items = ShoppingCartItem.all
    shopping_cart_items.destroy_all
    render 'index'
  end
  
  private
  def shopping_cart_item_params
    params.require(:shopping_cart_item).permit(:item_id, :quantity)
  end
  
end
