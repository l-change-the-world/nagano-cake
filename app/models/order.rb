class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
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

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no-image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end