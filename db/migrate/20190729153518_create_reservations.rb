class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :salons_reservation_id, null: false
      t.integer :stylists_reservation_id, null: false
      t.integer :stylists_menu_id, null: false
      t.references :customer, foreign_key: true
      t.text :memo
      t.boolean :status, null: false, default: false

      t.timestamps
    end
  end
end
