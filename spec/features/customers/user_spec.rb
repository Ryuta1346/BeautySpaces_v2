require 'rails_helper'

RSpec.feature "Customers::Users", type: :feature do
  let!(:area1) { create(:area) }
  let!(:prefecture1) { create(:prefecture, area: area1) }
  let!(:category1) { create(:category, name: 'ヘアサロン') }
  let!(:category2) { create(:category, name: '一般利用') }
  let(:user) { create(:user, prefecture: prefecture1, category: category2) }
  let(:salon) { create(:salon, prefecture: prefecture1, category: category1) }

  scenario 'sign up for valid user' do
    visit root_path
    click_on 'Sign_up'
    expect {
      fill_in 'customer_name', with: 'Taro Yamada'
      fill_in 'customer_email', with: 'foo@example.com'
      fill_in 'customer_password', with: 'foobar'
      fill_in 'customer_password_confirmation', with: 'foobar'
      select "一般利用", from: 'customer_category_id'
      fill_in 'customer_tel', with: '00011111113'
      select '東京都', from: 'customer_prefecture_id'
      fill_in 'customer_city', with: '渋谷区'
      fill_in 'customer_address1', with: '道玄坂0-0'
      select 'User', from: 'customer_type'
      click_button 'Sign up'
    }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome! You have signed up successfully."
    expect(page).to have_content "Name: Taro Yamada"
  end

  scenario 'login for User' do
    visit root_path
    click_on 'Sign_in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_current_path user_path
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

  scenario 'deny to access to /mypage for another customer' do
    sign_in salon
    visit admin_salon_path
    expect(page).to have_current_path admin_salon_path
    visit user_path
    expect(page).to have_current_path root_path
  end
end
