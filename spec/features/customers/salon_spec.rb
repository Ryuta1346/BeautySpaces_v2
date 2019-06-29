require 'rails_helper'

RSpec.feature "Customers::Salons", type: :feature do
  let!(:category1) { create(:category) }
  let!(:prefecture1) { create(:prefecture) }
  let(:salon) { create(:salon, category_id: category1, prefecture: prefecture1) }
  let(:user) { create(:user, prefecture: prefecture1) }

  scenario 'sign up for Admin_Salon' do
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

  scenario 'login for Admin_Salon' do
    visit root_path
    click_on 'Sign_in'
    fill_in 'Email', with: salon.email
    fill_in 'Password', with: salon.password
    click_button 'Log in'
    expect(page).to have_current_path admin_salon_path
    expect(page).to have_content "Name: #{salon.name}"
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

  scenario 'deny to access with user to Admin_Salon page' do
    sign_in user
    visit user_path(user)
    visit admin_salon_path
    expect(page).to have_current_path root_path
  end
end
