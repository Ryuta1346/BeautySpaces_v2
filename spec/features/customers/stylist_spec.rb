require 'rails_helper'

RSpec.feature "Customers::Stylists", open_on_error: true, type: :feature do
  let!(:category1) { create(:category, name: 'ヘアサロン') }
  let!(:category2) { create(:category, name: '一般利用') }
  let!(:region1) { create(:region) }
  let!(:prefecture1) { create(:prefecture, region: region1) }
  let!(:stylist) { create(:stylist, category_id: category1.id, prefecture: prefecture1) }
  let(:user) { create(:user, prefecture: prefecture1, category_id: category2.id) }

  feature 'Sign up' do
    before do
      visit root_path
    end

    scenario 'with valid information' do
      visit new_stylist_registration_path
      expect {
        fill_in 'stylist_name', with: 'Taro Yamada'
        fill_in 'stylist_email', with: 'foo@example.com'
        fill_in 'stylist_password', with: 'foobar'
        fill_in 'stylist_password_confirmation', with: 'foobar'
        select "ヘアサロン", from: 'stylist_category_id'
        fill_in 'stylist_tel', with: '00011111112'
        select '東京都', from: 'stylist_prefecture_id'
        fill_in 'stylist_city', with: '渋谷区'
        fill_in 'stylist_address1', with: '道玄坂0-0'
        # select 'Stylist', from: 'customer_type'
        click_button 'Sign up'
      }.to change(Stylist, :count).by(1)
      expect(page).to have_current_path admin_stylist_path
      expect(page).to have_content "Name: Taro Yamada"
    end
  end

  feature 'Log in' do
    before do
      visit root_path
    end

    scenario 'with valid Stylist' do
      visit new_stylist_session_path
      fill_in 'Email', with: stylist.email
      fill_in 'Password', with: stylist.password
      click_button 'Log in'
      expect(page).to have_current_path admin_stylist_path
    end

    scenario 'with invalid information' do
      visit new_stylist_session_path
      fill_in 'Email', with: ""
      fill_in 'Password', with: ""
      click_button 'Log in'
      expect(page).to have_current_path new_stylist_session_path
    end

    scenario 'without admin information' do
      sign_in user
      visit user_path(user)
      visit admin_stylist_path
      expect(page).to have_current_path root_path
    end
  end

  feature 'registers a reservation information' do
    scenario 'with valid information' do
      sign_in stylist
      visit admin_stylist_path
      expect {
        select '2019', from: 'stylists_reservation_reservation_time_1i'
        select 'August', from: 'stylists_reservation_reservation_time_2i'
        select '10', from: 'stylists_reservation_reservation_time_3i'
        select '11', from: 'stylists_reservation_reservation_time_4i'
        select '15', from: 'stylists_reservation_reservation_time_5i'
        fill_in 'stylists_reservation[activity_scope]', with: '渋谷区道玄坂'
        fill_in 'stylists_reservation[operation_time]', with: '60'
        fill_in 'stylists_reservation[memo]', with: "あいうえお"
        click_on '登録'
      }.to change(Stylists::Reservation, :count).by(1)
      expect(page).to have_current_path admin_stylist_path
      expect(page).to have_content '予約可能時間の登録に成功しました'
      expect(page).to have_content "1.8月10日 土曜日 11:15 渋谷区道玄坂60分あいうえお"
    end
  end

  feature 'display reservation information' do
    let!(:reservation1) { create(:stylists_reservation, customer: stylist, reservation_time: "2019-08-01 12:00:00") }
    let!(:reservation2) { create(:stylists_reservation, customer: stylist, reservation_time: "2019-07-01 12:00:00") }

    scenario 'in descending order on top-page' do
      sign_in stylist
      visit admin_stylist_path
      # 降順で並べ替えられているか確認
      expect(page).to have_content "1.7月1日 月曜日 12:00"
      expect(page).to have_content "2.8月1日 木曜日 12:00"
    end
  end
end