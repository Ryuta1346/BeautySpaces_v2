class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :tel
      t.string :email
      t.references :prefecture, foreign_key: true
      t.string :place
      t.integer :birth_of_year

      t.timestamps
    end
  end
end
