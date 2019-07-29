class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :salons_reservation, class_name: "Salons::Reservation"
  belongs_to :stylists_reservation, class_name: "Stylists::Reservation"
  belongs_to :stylists_menu, class_name: "Stylists::Menu"
end
