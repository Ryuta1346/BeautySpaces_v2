# require 'rails_helper'
#
# RSpec.feature "Salons::Reservations", open_on_error: true, type: :feature do
#   let!(:category1) { create(:category, name: "ヘアサロン") }
#   let!(:region1) { create(:region) }
#   let!(:prefecture1) { create(:prefecture, region: region1) }
#   let!(:salon) { create(:salon, category_id: category1.id, prefecture: prefecture1) }
#   let!(:reservation){create(:reservation)}
#
#   feature 'Add new reservation frame' do
#     sign_in salon
#     visit admin_salon_path
#     scenario 'with valid information' do
#
#     end
#   end
# end
