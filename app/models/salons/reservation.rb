class Salons::Reservation < ApplicationRecord
  include Reservable

  has_many :reservations
end