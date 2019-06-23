class Salon < Customer
  validates :name, presence: true, length: { maximum: 30 }
  validates :num_of_sheets, length: { maximum: 50 }
  validates :features, length: { maximum: 200 }
  validates :address1, length: { maximum: 75 }
  validates :address2, length: { maximum: 75 }
end