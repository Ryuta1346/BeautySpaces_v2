class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :name
      t.string :en_name
      t.references :prefecture, foreign_key: true

      t.timestamps
    end
  end
end
