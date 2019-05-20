class Salon < ApplicationRecord
  belongs_to :category
  belongs_to :prefecture
  has_many :stylists
end
