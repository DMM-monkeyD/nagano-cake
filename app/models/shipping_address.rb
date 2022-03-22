class ShippingAddress < ApplicationRecord
    belongs_to :customer
    
  validates :name, presence: true
  validates :post_code, presence: true, format: {with: /^\d{7}$/, message: "ハイフンなしの７桁で入力して下さい"}
  validates :address, presence: true
  
end
