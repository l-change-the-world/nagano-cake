class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy #中間テーブル
  has_many :items, through: :ordered_items
  belongs_to :member

  # 注文ステータス (0：入金待ち、1：入金確認、2：制作中、3：発送準備中、4：発送済み)
  enum status: {
    waiting: 0,
    paid_check: 1,
    production: 2,
    preparing: 3,
    shipped: 4,
  }

  # 支払方法
  enum payment_method: {
    credit_card: 0,
    transfer: 1
  }

  def subtotal
    item.with_tax_price * quantity
  end

end
