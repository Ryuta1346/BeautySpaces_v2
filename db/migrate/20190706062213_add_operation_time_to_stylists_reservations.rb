class AddOperationTimeToStylistsReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :stylists_reservations, :operation_time, :integer
  end
end
