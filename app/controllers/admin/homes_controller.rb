class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @orders = Order.page(params[:page])
    # ページネーションは後から記述
  end

  private


end
