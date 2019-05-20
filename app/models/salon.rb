class Salon < ApplicationRecord
  belongs_to :category
  belongs_to :prefecture
end
