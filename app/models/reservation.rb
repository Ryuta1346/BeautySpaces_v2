class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :salons_reservation, class_name: "Salons::Reservation"
  belongs_to :stylists_reservation, class_name: "Stylists::Reservation"
  belongs_to :stylists_menu, class_name: "Stylists::Menu"

  def self.include_reserve_info(salon_info)
    joins(salons_reservation: :customer).where(salons_reservation_id: salon_info)
  end

  def self.specify_datetime
    where("salons_reservations.reservation_time >= ?", Date.today.ctime).where("salons_reservations.reservation_time < ?", Date.tomorrow.ctime)
  end
end
