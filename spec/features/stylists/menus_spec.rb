require 'rails_helper'

RSpec.feature "Stylists::Menus", type: :feature do
  let!(:category1) { create(:category) }
  let!(:prefecture1) { create(:prefecture) }
  let!(:stylist) { create(:stylist, category: category1, prefecture: prefecture1) }

  before do
    sign_in stylist
    visit admin_stylist_menus_path
  end

  feature 'create new menu' do
    scenario 'with valid information' do
      fill_in 'stylists_menu[name]', with: 'お得なカット+カラー+トリートメントセット'
      fill_in 'stylists_menu[price]', with: '8990'
      fill_in 'stylists_menu[operation_time]', with: '120'
      fill_in 'stylists_menu[sales_copy]', with: 'カット、カラー、トリートメントがお得に利用できるセットです'
      fill_in 'stylists_menu[content]', with: 'カット+カラー+トリートメント'
      fill_in 'stylists_menu[memo]', with: "カラー剤の持ち込みで5%割引"
      click_on '登録'
      expect(page).to have_current_path admin_stylist_menus_path
      expect(page).to have_content 'メニューの登録に成功しました'
      expect(page).to have_content "お得なカット+カラー+トリートメントセット"
    end

    scenario 'with brank menu_name' do
      fill_in 'stylists_menu[name]', with: ''
      fill_in 'stylists_menu[price]', with: '8990'
      fill_in 'stylists_menu[operation_time]', with: '120'
      fill_in 'stylists_menu[sales_copy]', with: 'カット、カラー、トリートメントがお得に利用できるセットです'
      fill_in 'stylists_menu[content]', with: 'カット+カラー+トリートメント'
      fill_in 'stylists_menu[memo]', with: "カラー剤の持ち込みで5%割引"
      click_on '登録'
      expect(page).to have_current_path admin_stylist_menus_path
      expect(page).to have_content 'メニューの登録に失敗しました'
    end
  end
end