require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let!(:category1) { create(:category, name: "ヘアサロン") }
  let!(:category2) { create(:category, name: "") }
  let!(:region1) { create(:region) }
  let!(:prefecture1) { create(:prefecture, region: region1) }
  let!(:salon1) { create(:salon, category_id: category1.id, prefecture: prefecture1) }
  let!(:stylist1) { create(:stylist, category_id: category1.id, prefecture: prefecture1) }
  let!(:stylists_menu1) { create(:stylists_menu, customer: stylist1) }
  let!(:salons_reservation1) { create(:salons_reservation, customer: salon1, reservation_time: "#{Date.today} 17:00:00") }
  let!(:salons_reservation2) { create(:salons_reservation, customer: salon1, reservation_time: "#{Date.today} 12:00:00") }
  let!(:stylists_reservation1) { create(:stylists_reservation, customer: stylist1, reservation_time: "#{Date.today} 17:00:00") }
  let!(:stylists_reservation2) { create(:stylists_reservation, customer: stylist1, reservation_time: "#{Date.today} 12:00:00") }
  let!(:user) { create(:user, prefecture: prefecture1, category_id: category2.id) }
  let!(:reservation1) {
    create(:reservation,
           salons_reservation:   salons_reservation1,
           stylists_reservation: stylists_reservation1,
           stylists_menu:        stylists_menu1,
           customer:             user)
  }
  let!(:reservation2) {
    create(:reservation,
           salons_reservation:   salons_reservation2,
           stylists_reservation: stylists_reservation2,
           stylists_menu:        stylists_menu1,
           customer:             user)
  }

  it "returns reservation information for own salon" do
    expect(reservation_info(salon1).size).to eq 2
  end

  it "returns lists that display today's reservation information" do
    expect(reservation_info(salon1).only_today.size).to eq 2
    expect(reservation_info(salon1).only_today.first.salons_reservation.reservation_time).to eq reservation1.salons_reservation.reservation_time
  end

  it "returns reservation's schedule in the correct order" do
    expect(reservation_info(salon1).only_today.order(reservation_time: :asc).first).to eq reservation2
  end

  def reservation_info(salon)
    salon_reservation_ids = salon.salons_reservations.pluck(:id)
    Reservation.joins(salons_reservation: :customer).in_salon_reservations(salon_reservation_ids)
  end
end
