class OrderItem < 
    belongs_to :order
    belongs_to :item
    
  enum making_status: { not_yet: 0, waiting_production: 1, in_production: 2, complete_production: 3 }
end
