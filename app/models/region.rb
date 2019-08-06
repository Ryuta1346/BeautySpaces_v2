class Region < ApplicationRecord
  has_many :prefectures

  validates :name, :e_name, presence: true
end
