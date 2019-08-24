class Salons::Reservation < ApplicationRecord
  include Reservable

  has_many :reservations

  # def get_salon_info(salon)
  #   Salons::Reservation.where(customer: salon).pluck(:id)
  # end
end