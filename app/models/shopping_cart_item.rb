class ShoppingCartItem < ApplicationRecord
  belongs_to :member
  belongs_to :item
  
  def subtotal
    item.with_tax_price * quantity
  end
end
