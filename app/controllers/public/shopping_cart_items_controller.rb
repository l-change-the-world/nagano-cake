class Public::ShoppingCartItemsController < ApplicationController
  def index
     @shopping_cart_items = current_member.shopping_cart_items.all
     @items = Item.all
  # 0に小計(subtotal)を足していく
     @total = 0
  end

  def update
    @shopping_cart_item = ShoppingCartItem.find(current_member.id)
    if @shopping_cart_item.update(shopping_cart_item_params)
      redirect_to request.referer
    else
      render :index
    end
  end

  def destroy
    @shopping_cart_item = ShoppingCartItem.find(current_member.id)
    @shopping_cart_item.destroy
    redirect_to request.referer
  end

  def destroy_all
    @shopping_cart_items = current_member.shopping_cart_items.all
    @shopping_cart_items.destroy_all
    redirect_to request.referer
  end

  def create
    existing_shopping_cart_item = current_member.shopping_cart_items.find_by(item_id: params[:shopping_cart_item][:item_id])
    if existing_shopping_cart_item
      existing_shopping_cart_item.quantity += params[:shopping_cart_item][:quantity].to_i
      if existing_shopping_cart_item.save
        redirect_to shopping_cart_items_path
      else
        render :index
      end
    else
      @shopping_cart_item = ShoppingCartItem.new(shopping_cart_item_params)
      @shopping_cart_item.member_id = current_member_id
      if @shopping_cart_item.save
        redirect_to shopping_cart_items_path
      else
        render :index
      end
    end
  end

end
