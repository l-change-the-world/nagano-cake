class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.page(params[:page])
  end
  
  def show
    @item = Item.find(params[:id])
    @shopping_cart_item = ShoppingCartItem
  end
  
  private
  def item_params
    params.require(:items).permit(:name, :description, :genre_id, :price_excluding_tax, :is_for_sale)
  end

end
