class Region < ApplicationRecord
  has_many :prefectures

  def take_place
    prefectures.pluck(:name, :e_name)
  end
end
