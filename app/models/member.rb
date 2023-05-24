class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :shopping_cart_items, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy
  has_many :orders, dependent: :destroy

  #バリデーション
    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :last_name_ruby, presence: true
    validates :first_name_ruby, presence: true
    validates :postal_code, presence: true
    validates :address, presence: true
    validates :telephone_number, presence: true


  # ログイン時に退会済みのユーザーが同じアカウントでログイン出来ないよう制約を設ける
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  def boolean_label(value)
    value ? '退会' : '有効'
  end
  
end
