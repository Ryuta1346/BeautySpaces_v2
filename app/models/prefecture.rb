class Prefecture < ApplicationRecord
  has_many :customers
  belongs_to :area
end
