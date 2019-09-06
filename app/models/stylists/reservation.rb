class Stylists::Reservation < ApplicationRecord
  include Reservable
  has_one :reservation
  validates :activity_scope, presence: true
end