class Area < ApplicationRecord
  belongs_to :prefecture

  validates :name, :e_name, presence: true
end
