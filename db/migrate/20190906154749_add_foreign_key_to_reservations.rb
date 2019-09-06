class AddForeignKeyToReservations < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :reservations, :salons_reservations
    add_foreign_key :reservations, :stylists_reservations
  end
end
