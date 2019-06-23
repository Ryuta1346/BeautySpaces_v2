class Salon < Customer
  validates :name, presence: true, length: { maximum: 30 }
  validates :tel, presence: true, length: { maximum: 11, minimum: 10 }
  validates :num_of_sheets, length: { maximum: 50 }
  validates :features, length: { maximum: 200 }
  validates :city, length: { maximum: 20 }
  validates :address1, length: { maximum: 50 }
end