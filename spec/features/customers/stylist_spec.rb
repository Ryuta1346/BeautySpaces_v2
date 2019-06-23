require 'rails_helper'

RSpec.feature "Customers::Stylists", type: :feature do
  let!(:category1) { create(:category) }
  let!(:prefecture1) { create(:prefecture) }
  let(:stylist) { create(:stylist, category_id: category1, prefecture_id: prefecture1) }

  scenario 'sign up for Admin_Stylist' do
    visit root_path
    click_on 'Sign_up'
    fill_in 'customer_email', with: 'foo@example.com'
    fill_in 'customer_password', with: 'foobar'
    fill_in 'customer_password_confirmation', with: 'foobar'
    fill_in 'customer_name', with: 'Taro Yamada'
    select 'Stylist', from: 'customer_type'
    click_button 'Sign up'

    expect(page).to have_current_path admin_stylist_path
    expect(page).to have_content "Welcome! You have signed up successfully."
    expect(page).to have_content "Name: Taro Yamada"
  end

  scenario 'log in for Admin_Stylist' do
    visit root_path
    click_on 'Sign_in'
    fill_in 'Email', with: stylist.email
    fill_in 'Password', with: stylist.password
    click_button 'Log in'
    expect(page).to have_current_path admin_stylist_path
  end
end
