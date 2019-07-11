class CreateStylistsMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :stylists_menus do |t|
      t.references :customer, foreign_key: true
      t.string :name
      t.integer :price
      t.integer :operation_time
      t.string :content
      t.string :sales_copy
      t.string :memo

      t.timestamps
    end
  end
end
