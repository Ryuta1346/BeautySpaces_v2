class Prefecture < ApplicationRecord
  has_many :customers
  has_many :areas
  belongs_to :region

  validates :name, :e_name, presence: true
end
