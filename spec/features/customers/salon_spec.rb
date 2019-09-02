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

  ## ここ以下、表記場所変更のため一時無効化
  # feature 'registers a reservation' do
  #   before do
  #     sign_in salon
  #     visit admin_salon_path
  #   end
  #
  #   scenario 'with valid information' do
  #     expect {
  #       select '2019', from: 'salons_reservation_reservation_time_1i'
  #       select 'August', from: 'salons_reservation_reservation_time_2i'
  #       select '10', from: 'salons_reservation_reservation_time_3i'
  #       select '11', from: 'salons_reservation_reservation_time_4i'
  #       select '15', from: 'salons_reservation_reservation_time_5i'
  #       fill_in 'salons_reservation[operation_time]', with: '60'
  #       fill_in 'salons_reservation[memo]', with: "あいうえお"
  #       click_on '登録'
  #     }.to change(Salons::Reservation, :count).by(1)
  #     expect(page).to have_current_path admin_salon_path
  #     expect(page).to have_content '予約可能時間の登録に成功しました'
  #     expect(page).to have_content "8月10日 土曜日 11:15 60分あいうえお"
  #   end
  #
  #   scenario 'with invalid information' do
  #     fill_in 'salons_reservation[operation_time]', with: ''
  #     click_on '登録'
  #     expect(page).to have_content '予約可能時間の登録に失敗しました'
  #     expect(page).to have_current_path admin_salon_path
  #   end
  # end

  # feature 'display reservation information' do
  #   let!(:reservation1) { create(:salons_reservation, customer: salon, reservation_time: "2019-08-01 12:00:00") }
  #   let!(:reservation2) { create(:salons_reservation, customer: salon, reservation_time: "2019-07-01 12:00:00") }
  #
  #   scenario 'in descending order on top-page' do
  #     sign_in salon
  #     visit admin_salon_path
  #     # 降順で並べ替えられているか確認
  #     expect(page).to have_content "1.7月1日 月曜日 12:00"
  #     expect(page).to have_content "2.8月1日 木曜日 12:00"
  #   end
  # end
end

