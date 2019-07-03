class CreateStylistsReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :stylists_reservations do |t|
      t.references :customer, foreign_key: true
      t.datetime :reservation_time
      t.time :operating_time
      t.string :activity_scope
      t.text :memo
      t.boolean :status, default: false, null:false

      t.timestamps
    end
  end
end
