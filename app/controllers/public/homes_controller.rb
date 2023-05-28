class Public::HomesController < ApplicationController
  def top
    @items = Item.order('id DESC').limit(4)
    # トップ画面には商品登録日の新しい順に４件表示
    @genres = Genre.all
  end

  def about
  end
end
