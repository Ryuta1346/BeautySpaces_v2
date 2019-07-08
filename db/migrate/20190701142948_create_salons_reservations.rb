class CreateSalonsReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :salons_reservations do |t|
      t.references :customer, foreign_key: true, null: false
      t.datetime :reservation_time
      t.integer :operation_time
      t.text :memo
      t.boolean :status, default: false, null:false

      t.timestamps
    end
  end
end
