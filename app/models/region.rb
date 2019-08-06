class Region < ApplicationRecord
  has_many :prefectures

  validates :name, :en_name, presence: true
end
