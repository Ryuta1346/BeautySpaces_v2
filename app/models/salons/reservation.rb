class Salons::Reservation < ApplicationRecord
  include Reservable
  has_many :reservations
  default_scope -> { order(reservation_time: :asc) }
end