class Stylists::Menu < ApplicationRecord
  has_many :reservations
  belongs_to :customer

  validates :name, :price, :operation_time, :content, presence: true
  validates :sales_copy, length: { maximum: 100 }
end
