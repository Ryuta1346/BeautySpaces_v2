class Stylist < Customer
  belongs_to :category

  validates :features, length: { maximum: 200 }
  validates :activity_scope, length: { maximum: 20 }
end
