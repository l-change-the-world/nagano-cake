class ShoppingCartItem < ApplicationRecord
  belongs_to :member
  belongs_to :item
  
  def subtotal
    
  end
end
