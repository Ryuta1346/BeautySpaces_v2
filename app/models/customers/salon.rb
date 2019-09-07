class Salon < Customer
  belongs_to :category
  validates :num_of_sheets, length: { maximum: 50 }
  validates :features, length: { maximum: 200 }
  validates :city, length: { maximum: 20 }
end