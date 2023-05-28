class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.page(params[:page])
    @genres = Genre.all
  end
  
  def show
    @item = Item.find(params[:id])
    @shopping_cart_item = ShoppingCartItem
    @genres = Genre.all
  end
  
  private
  def item_params
    params.require(:items).permit(:name, :description, :genre_id, :price_excluding_tax, :is_for_sale)
  end

end
