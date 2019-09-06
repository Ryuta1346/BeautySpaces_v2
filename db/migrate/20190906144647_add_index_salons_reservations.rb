class AddIndexSalonsReservations < ActiveRecord::Migration[5.2]
  def change
    add_index :salons_reservations, :reservation_time
  end
end
