class Stylist < Customer
  validates :name, presence: true, length: { maximum: 30 }
  validates :features, length: { maximum: 200 }
  validates :address1, length: { maximum: 20 }
  validates :address2, length: { maximum: 50 }
  validates :activity_scope, length: {maximum: 20}
end
