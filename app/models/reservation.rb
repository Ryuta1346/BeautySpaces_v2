class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :salons_reservation, class_name: "Salons::Reservation"
  belongs_to :stylists_reservation, class_name: "Stylists::Reservation"
  belongs_to :stylists_menu, class_name: "Stylists::Menu"

  # default_scope -> { order(reservation_time: :asc) }

  def self.joins_reserve_info(salon_info)
    joins(salons_reservation: :customer).where(salons_reservation_id: salon_info)
  end

  def self.specify_datetime
    where("salons_reservations.reservation_time >= ?", "2019-09-01 00:00:00").where("salons_reservations.reservation_time < ?", "2019-09-02 00:00:00")
  end

  # where("salons_reservations.reservation_time >= ?", Date.today.ctime).where("salons_reservations.reservation_time < ?", Date.tomorrow.ctime)

end
