class AddIndexStylistsReservations < ActiveRecord::Migration[5.2]
  def change
    add_index :stylists_reservations, :reservation_time
  end
end
