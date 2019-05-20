class CreateStylists < ActiveRecord::Migration[5.2]
  def change
    create_table :stylists do |t|
      t.string :name
      t.references :prefecture, foreign_key: true
      t.references :category, foreign_key: true
      t.references :salon, foreign_key: true
      t.string :active_scope
      t.string :tel
      t.string :email
      t.string :features
      t.integer :history_of_stylist
      t.string :photo

      t.timestamps
    end
  end
end
