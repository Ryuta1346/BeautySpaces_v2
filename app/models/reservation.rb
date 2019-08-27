class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :salons_reservation, class_name: "Salons::Reservation"
  belongs_to :stylists_reservation, class_name: "Stylists::Reservation"
  belongs_to :stylists_menu, class_name: "Stylists::Menu"

  # default_scope -> { order(reservation_time: :asc) }

  def self.joins_reserve_info(salon_ids)
    joins(salons_reservation: :customer).where(salons_reservation_id: salon_ids)
  end

  def self.specify_datetime
    # 日付は仮置き。Date.today.ctimeおよびDate.tomorrow.ctimeを指定予定
    where("salons_reservations.reservation_time >= ?", "2019-09-01 00:00:00").where("salons_reservations.reservation_time < ?", "2019-09-02 00:00:00")
  end
end
