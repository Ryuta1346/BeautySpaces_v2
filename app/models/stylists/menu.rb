class Stylists::Menu < ApplicationRecord
  belongs_to :customer

  validates :name, :price, :operation_time, :content, presence: true
  validates :sales_copy, length: { maximum: 100 }
end
