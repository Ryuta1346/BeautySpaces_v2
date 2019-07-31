class Prefecture < ApplicationRecord
  has_many :customers
  has_many :areas
  belongs_to :region

  def take_place
    areas.pluck(:name, :e_name)
  end
end
