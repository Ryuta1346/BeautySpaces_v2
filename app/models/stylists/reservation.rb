class Stylists::Reservation < ApplicationRecord
  include Reservable
  has_many :reservations
  validates :activity_scope, presence: true
end