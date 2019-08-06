class Prefecture < ApplicationRecord
  has_many :customers
  has_many :areas
  belongs_to :region
end
