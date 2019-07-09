require 'rails_helper'

RSpec.feature "Customers::Salons", type: :feature do
  let!(:category1) { create(:category) }
  let!(:prefecture1) { create(:prefecture) }
  let!(:salon) { create(:salon, category_id: category1, prefecture: prefecture1) }
  let(:user) { create(:user, prefecture: prefecture1) }

  feature 'Sign up' do
    scenario 'with valid information' do
      visit root_path
      click_on 'Sign_up'
      expect {
        fill_in 'customer_name', with: 'ABC Salon'
        fill_in 'customer_email', with: 'foo@example.com'
        fill_in 'customer_password', with: 'foobar'
        fill_in 'customer_password_confirmation', with: 'foobar'
        fill_in 'customer_tel', with: '00011111111'
        # select '東京都', from: 'customer_prefecture_id'
        fill_in 'customer_city', with: '渋谷区'
        fill_in 'customer_address1', with: '道玄坂0-0'
        select 'Salon', from: 'customer_type'
        click_button 'Sign up'
      }.to change(Salon, :count).by(1)

      expect(page).to have_current_path admin_salon_path
      expect(page).to have_content "Welcome! You have signed up successfully."
      expect(page).to have_content "Name: ABC Salon"
    end
  end

  feature 'Log in' do
    scenario 'with valid information' do
      visit root_path
      click_on 'Sign_in'
      fill_in 'Email', with: salon.email
      fill_in 'Password', with: salon.password
      click_button 'Log in'
      expect(page).to have_current_path admin_salon_path
      expect(page).to have_content "Name: #{salon.name}"
    end

    scenario 'with invalid information' do
      visit root_path
      click_on 'Sign_in'
      fill_in 'Email', with: ""
      fill_in 'Password', with: ""
      click_button 'Log in'
      expect(page).to have_current_path new_customer_session_path
      expect(page).to have_content "Invalid Email or password."
    end

    scenario 'without admin information' do
      sign_in user
      visit user_path(user)
      visit admin_salon_path
      expect(page).to have_current_path root_path
    end
  end

  feature 'registers a reservation' do
    scenario 'with valid information' do
      sign_in salon
      visit admin_salon_path
      select '2019', from: 'salons_reservation_reservation_time_1i'
      select 'August', from: 'salons_reservation_reservation_time_2i'
      select '10', from: 'salons_reservation_reservation_time_3i'
      select '11', from: 'salons_reservation_reservation_time_4i'
      select '15', from: 'salons_reservation_reservation_time_5i'
      fill_in 'salons_reservation[operation_time]', with: '60'
      fill_in 'salons_reservation[memo]', with: "あいうえお"
      click_on '登録'
      expect(page).to have_current_path admin_salon_path
      expect(page).to have_content '予約可能時間の登録に成功しました'
      expect(page).to have_content "8月10日 土曜日 11:15 60分あいうえお"
    end

    scenario 'with invalid information' do
      sign_in salon
      visit admin_salon_path
      fill_in 'salons_reservation[operation_time]', with: ''
      click_on '登録'
      expect(page).to have_content '予約可能時間の登録に失敗しました'
      expect(page).to have_current_path admin_salon_path
    end
  end

  feature 'display reservation information' do
    let!(:reservation1) { create(:salons_reservation, customer: salon, reservation_time: "2019-08-01 12:00:00") }
    let!(:reservation2) { create(:salons_reservation, customer: salon, reservation_time: "2019-07-01 12:00:00") }

    scenario 'in descending order on top-page' do
      sign_in salon
      visit admin_salon_path
      # 降順で並べ替えられているか確認
      expect(page).to have_content "1.7月1日 月曜日 12:00"
      expect(page).to have_content "2.8月1日 木曜日 12:00"
    end
  end
end

