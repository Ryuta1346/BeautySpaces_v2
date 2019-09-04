class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :salons_reservation, class_name: "Salons::Reservation"
  belongs_to :stylists_reservation, class_name: "Stylists::Reservation"
  belongs_to :stylists_menu, class_name: "Stylists::Menu"

  scope :in_salon_reservations, ->(_salon_ids) { where(salons_reservation_id: _salon_ids) }
  scope :only_today, -> { where(salons_reservations: { reservation_time: Time.current.all_day }) }

  def self.reserved_schedules(salon_reservation_ids)
    self.includes(:salons_reservation, :stylists_menu, :customer, stylists_reservation: [:customer])
        .joins(salons_reservation: :customer)
        .in_salon_reservations(salon_reservation_ids)
        .only_today
        .order(reservation_time: :asc)
  end
end