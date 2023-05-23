class ShippingAddress < ApplicationRecord
  belongs_to :member
  
  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end
end
