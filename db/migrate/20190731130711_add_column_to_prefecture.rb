class AddColumnToPrefecture < ActiveRecord::Migration[5.2]
  def change
    add_reference :prefectures, :region, foreign_key: true
    add_column :prefectures, :en_name, :string
  end
end
