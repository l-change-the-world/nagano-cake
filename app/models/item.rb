class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :genre
  has_many :order_items, dependent: :destroy
  has_many :shopping_cart_items, dependent: :destroy

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def add_tax_sales_price
  (self.price_excluding_tax * 1.10).round
  end

end
