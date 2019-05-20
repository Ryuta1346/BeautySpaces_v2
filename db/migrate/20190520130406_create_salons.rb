class CreateSalons < ActiveRecord::Migration[5.2]
  def change
    create_table :salons do |t|
      t.references :category, foreign_key: true
      t.references :prefecture, foreign_key: true
      t.string :name
      t.string :place
      t.string :tel
      t.string :email
      t.string :features
      t.integer :num_of_stylists
      t.integer :num_of_sheets
      t.datetime :opening_time
      t.datetime :closing_time

      t.timestamps
    end
  end
end
