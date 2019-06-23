class User < Customer
  validates :name, presence: true, length: { maximum: 30 }
  validates :address1, length: { maximum: 20 }
  validates :address2, length: { maximum: 50 }
end
