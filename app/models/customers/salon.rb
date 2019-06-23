class Salon < Customer
  validates :prefecture, presence: true
  validates :category, presence: true
  validates :name, presence: true, length: { maximum: 30 }
  validates :tel, presence: true, numericality: { only_integer: true }, length: { is: 11 }, uniqueness: true
  validates :num_of_sheets, presence: true, length: { maximum: 50 }
  validates :features, presence: true, length: { maximum: 200 }
  validates :opening_time, presence: true, numericality: { only_integer: true }
  validates :closing_time, presence: true, numericality: { only_integer: true }
  validates :address1, presence: true
  validates :address2, presence: true
end