class Area < ApplicationRecord
  belongs_to :prefecture

  validates :name, :en_name, presence: true
end
