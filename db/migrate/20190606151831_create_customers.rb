class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :type, default: false, null: false
      t.string :name
      t.string :tel
      t.references :prefecture, foreign_key: true
      t.references :category, foreign_key: true
      t.integer :birth_of_year
      t.string :activity_scope
      t.string :features
      t.integer :num_of_sheets
      t.time :opening_time
      t.time :ending_time
      t.integer :since

      t.timestamps
    end
  end
end
