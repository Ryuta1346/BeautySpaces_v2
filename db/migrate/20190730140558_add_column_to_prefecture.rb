class AddColumnToPrefecture < ActiveRecord::Migration[5.2]
  def change
    add_reference :prefectures, :area, foreign_key: true
    add_column :prefectures, :e_name, :string
  end
end
