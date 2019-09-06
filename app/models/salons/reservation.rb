class Salons::Reservation < ApplicationRecord
  include Reservable
  has_one :reservation
  default_scope -> { order(reservation_time: :asc) }
end