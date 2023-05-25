class ShippingAddress < ApplicationRecord
  belongs_to :member
  # バリデーション
  validates :address, presence: true
  validates :name, presence: true
  validates :postal_code, presence: true
  
  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end
end
