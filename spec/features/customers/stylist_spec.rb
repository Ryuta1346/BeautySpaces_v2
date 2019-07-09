require 'rails_helper'

RSpec.feature "Customers::Stylists", type: :feature do
  let!(:category1) { create(:category) }
  let!(:prefecture1) { create(:prefecture) }
  let!(:stylist) { create(:stylist, category_id: category1, prefecture: prefecture1) }
  let(:user) { create(:user, prefecture: prefecture1) }

  feature 'Sign up' do
    scenario 'sign up for Admin_Stylist' do
      visit root_path
      click_on 'Sign_up'
      expect {
        fill_in 'customer_name', with: 'Taro Yamada'
        fill_in 'customer_email', with: 'foo@example.com'
        fill_in 'customer_password', with: 'foobar'
        fill_in 'customer_password_confirmation', with: 'foobar'
        fill_in 'customer_tel', with: '00011111112'
        # select '東京都', from: '都道府県'
        fill_in 'customer_city', with: '渋谷区'
        fill_in 'customer_address1', with: '道玄坂0-0'
        select 'Stylist', from: 'customer_type'
        click_button 'Sign up'
      }.to change(Stylist, :count).by(1)

      expect(page).to have_current_path admin_stylist_path
      expect(page).to have_content "Welcome! You have signed up successfully."
      expect(page).to have_content "Name: Taro Yamada"
    end
  end

  feature 'Log in' do
    scenario 'log in for Admin_Stylist' do
      visit root_path
      click_on 'Sign_in'
      fill_in 'Email', with: stylist.email
      fill_in 'Password', with: stylist.password
      click_button 'Log in'
      expect(page).to have_current_path admin_stylist_path
    end

    scenario 'login with invalid information' do
      visit root_path
      click_on 'Sign_in'
      fill_in 'Email', with: ""
      fill_in 'Password', with: ""
      click_button 'Log in'
      expect(page).to have_current_path new_customer_session_path
      expect(page).to have_content "Invalid Email or password."
    end

    scenario 'deny to access with user to Admin_Stylist page' do
      sign_in user
      visit user_path(user)
      visit admin_stylist_path
      expect(page).to have_current_path root_path
    end
  end

  feature 'registers a reservation' do
    scenario 'registers a reservation which can be accepts' do
      sign_in stylist
      visit admin_stylist_path
      select '2019', from: 'stylists_reservation_reservation_time_1i'
      select 'August', from: 'stylists_reservation_reservation_time_2i'
      select '10', from: 'stylists_reservation_reservation_time_3i'
      select '11', from: 'stylists_reservation_reservation_time_4i'
      select '15', from: 'stylists_reservation_reservation_time_5i'
      fill_in 'stylists_reservation[activity_scope]', with: '渋谷区道玄坂'
      fill_in 'stylists_reservation[operation_time]', with: '60'
      fill_in 'stylists_reservation[memo]', with: "あいうえお"
      click_on '登録'
      expect(page).to have_current_path admin_stylist_path
      expect(page).to have_content '予約可能時間の登録に成功しました'
      expect(page).to have_content "2019-08-10 11:15:00 UTC渋谷区道玄坂60あいうえお"
    end
  end

  feature 'display the reservation list' do
    let!(:reservation1) { create(:stylists_reservation, customer: stylist, reservation_time: "2019-08-01 12:00:00") }
    let!(:reservation2) { create(:stylists_reservation, customer: stylist, reservation_time: "2019-07-01 12:00:00") }

    scenario 'sort reservations list in descending order' do
      sign_in stylist
      visit admin_stylist_path
      # 降順で並べ替えられているか確認
      expect(page).to have_content "1.7月1日 月曜日 12:00"
      expect(page).to have_content "2.8月1日 木曜日 12:00"
    end
  end
end