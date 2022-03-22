class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  
  validates :total_price, presence: true
  validates :payment_method, presence: true
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_deposit: 0, confirm_deposit: 1, in_production: 2, ready_ship: 3, complete_ship: 4 }
end
