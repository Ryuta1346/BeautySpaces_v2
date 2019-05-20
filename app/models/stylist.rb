class Stylist < ApplicationRecord
  belongs_to :prefecture
  belongs_to :category
  belongs_to :salon
end
