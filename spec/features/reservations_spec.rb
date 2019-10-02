require 'rails_helper'

RSpec.feature "Reservations", type: :feature do
  let(:category1) { create(:category, name: "ヘアサロン") }
  let(:category2) { create(:category, name: '一般利用') }
  let(:region1) { create(:region) }
  let(:prefecture1) { create(:prefecture, region: region1) }

  let(:salon1) { create(:salon, category_id: category1.id, prefecture: prefecture1) }
  let(:salons_reservation1) { create(:salons_reservation, customer: salon1) }

  let!(:stylist1) { create(:stylist, category_id: category1.id, prefecture: prefecture1) }
  let(:stylists_reservation1) { create(:stylists_reservation, customer: stylist1) }
  let!(:stylists_menu1) { create(:stylists_menu, customer: stylist1) }

  let(:user1) { create(:user, prefecture: prefecture1, category_id: category2.id) }
  let!(:reservation1) {
    create(:reservation,
           salons_reservation:   salons_reservation1,
           stylists_reservation: stylists_reservation1,
           stylists_menu:        stylists_menu1,
           customer:             user1)
  }

  feature 'is displayed', open_on_error: true do
    scenario 'on Salon admin page' do
      go_to_salon_page
      expect(page).to have_content reservation1.customer.name
    end

    scenario 'on Stylist admin page' do
      go_to_stylist_page
    end

    scenario 'on User page' do
      go_to_user_page
    end
  end

  feature 'is registered', open_on_error: true do
    scenario 'on User page' do
      go_to_user_page
    end
  end

  def go_to_salon_page
    sign_in salon1
    visit admin_salon_path
  end

  def go_to_stylist_page
    sign_in stylist1
    visit admin_stylist_path
  end

  def go_to_user_page
    sign_in user1
    visit user_path
  end
end
