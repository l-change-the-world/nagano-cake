class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
     redirect_to admin_item_path(@item)
    else
     render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path
  end

  def index
    @items = Item.all.page(params[:page])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name,:description, :genre_id, :price_excluding_tax, :is_for_sale)
  end

end
