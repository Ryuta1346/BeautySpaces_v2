class CreateSalonsReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :salons_reservations do |t|
      t.references :customer, foreign_key: true
      t.datetime :reservation_time
      t.time :operation_time
      t.text :memo
      t.boolean :status, default: false, null:false

      t.timestamps
    end
  end
end
