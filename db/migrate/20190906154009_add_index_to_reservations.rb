class AddIndexToReservations < ActiveRecord::Migration[5.2]
  def change
    add_index :reservations, :salons_reservation_id, unique: true
    add_index :reservations, :stylists_reservation_id, unique: true
    add_index :reservations, :stylists_menu_id
  end
end
