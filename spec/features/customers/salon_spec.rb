require 'rails_helper'

RSpec.feature "Customers::Salons", open_on_error: true, type: :feature do
  let!(:category1) { create(:category, name: "ヘアサロン") }
  let!(:category2) { create(:category, name: '一般利用') }
  let!(:region1) { create(:region) }
  let!(:prefecture1) { create(:prefecture, region: region1) }
  let!(:salon) { create(:salon, category_id: category1.id, prefecture: prefecture1) }
  let(:user) { create(:user, prefecture: prefecture1, category_id: category2.id) }

  feature 'Sign up' do
    scenario 'with valid information' do
      visit root_path
      visit new_salon_registration_path
      expect {
        fill_in 'salon[name]', with: 'AKASATANA Salon'
        fill_in 'salon[email]', with: 'foo@example.com'
        fill_in 'salon[password]', with: 'foobar'
        fill_in 'salon[password_confirmation]', with: 'foobar'
        select 'ヘアサロン', from: "salon_category_id"
        fill_in 'salon_tel', with: '00011111111'
        select "東京都", from: "salon_prefecture_id"
        fill_in 'salon[city]', with: '渋谷区'
        fill_in 'salon[address1]', with: '道玄坂0-0'
        # select 'Salon', from: 'salon[type]'
        click_button 'Sign up'
      }.to change(Salon, :count).by(1)
      expect(page).to have_current_path admin_salon_path
      expect(page).to have_content "AKASATANA Salon"
    end
  end

  feature 'Log in' do
    scenario 'with valid information' do
      visit root_path
      visit new_salon_session_path
      fill_in 'Email', with: salon.email
      fill_in 'Password', with: salon.password
      click_button 'Log in'
      expect(page).to have_current_path admin_salon_path
      expect(page).to have_content salon.name
    end

    scenario 'with invalid information' do
      visit root_path
      visit new_salon_session_path
      fill_in 'Email', with: ""
      fill_in 'Password', with: ""
      click_button 'Log in'
      expect(page).to have_current_path new_salon_session_path
    end

    scenario 'without admin information' do
      sign_in user
      visit user_path(user)
      visit admin_salon_path
      expect(page).to have_current_path root_path
    end
  end
end

