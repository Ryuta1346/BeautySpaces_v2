require 'rails_helper'

RSpec.feature "Customers::Users", type: :feature do
  let!(:region1) { create(:region) }
  let!(:prefecture1) { create(:prefecture, region: region1) }
  let!(:category1) { create(:category, name: 'ヘアサロン') }
  let!(:category2) { create(:category, name: nil) }
  let(:user) { create(:user, prefecture: prefecture1, category_id: category2.id) }
  let(:salon) { create(:salon, prefecture: prefecture1, category_id: category1.id) }

  scenario 'sign up for valid user' do
    visit root_path
    click_on '会員登録'
    expect {
      fill_in 'user_name', with: 'Taro Yamada'
      fill_in 'user_email', with: 'foo@example.com'
      fill_in 'user_password', with: 'foobar'
      fill_in 'user_password_confirmation', with: 'foobar'
      fill_in 'user_tel', with: '00011111113'
      select '東京都', from: 'user_prefecture_id'
      fill_in 'user_city', with: '渋谷区'
      fill_in 'user_address1', with: '道玄坂0-0'
      click_button 'Sign up'
    }.to change(User, :count).by(1)
    expect(page).to have_content "Name: Taro Yamada"
  end

  scenario 'login for User' do
    visit root_path
    click_on 'ログイン'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_current_path user_path
  end

  scenario 'login with invalid information' do
    visit root_path
    click_on 'ログイン'
    fill_in 'Email', with: ""
    fill_in 'Password', with: ""
    click_button 'Log in'
    expect(page).to have_current_path new_user_session_path
  end

  scenario 'deny to access to /mypage for another customer' do
    sign_in salon
    visit admin_salon_path
    expect(page).to have_current_path admin_salon_path
    visit user_path
    expect(page).to have_current_path root_path
  end
end
