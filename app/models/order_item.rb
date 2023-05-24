class OrderItem < ApplicationRecord

  belongs_to :order
  belongs_to :item

  # 製作ステータス (0：着手不可、1：製作待ち、2：製作中、3：製作完了)
   enum production_status: {
    cannot_start: 0,
    waiting: 1,
    production: 2,
    complete: 3,
  }

  def subtotal
    price * quantity
  end

end
