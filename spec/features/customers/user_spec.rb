require 'rails_helper'

RSpec.feature "Customers::Users", type: :feature do
  let(:prefecture1) { create(:prefecture) }
  let(:user) { create(:user, prefecture_id: prefecture1) }

  scenario 'sign up for User' do
    visit root_path
    click_on 'Sign_up'
    expect {
      fill_in 'customer_email', with: 'foo@example.com'
      fill_in 'customer_password', with: 'foobar'
      fill_in 'customer_password_confirmation', with: 'foobar'
      fill_in 'customer_name', with: 'Taro Yamada'
      select 'User', from: 'customer_type'
      click_button 'Sign up'
    }.to change(User, :count).by(1)

    expect(page).to have_content "Welcome! You have signed up successfully."
    expect(page).to have_content "Name: Taro Yamada"
  end

  scenario 'log in for User' do
    visit root_path
    click_on 'Sign_in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_current_path user_path(user)
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
end
