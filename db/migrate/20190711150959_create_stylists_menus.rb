class CreateStylistsMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :stylists_menus do |t|
      t.references :customer, foreign_key: true
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :operation_time, null: false
      t.string :content, null: false
      t.string :sales_copy
      t.string :memo

      t.timestamps
    end
  end
end
