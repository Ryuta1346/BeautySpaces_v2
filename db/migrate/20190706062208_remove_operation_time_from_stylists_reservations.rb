class RemoveOperationTimeFromStylistsReservations < ActiveRecord::Migration[5.2]
  def change
    remove_column :stylists_reservations, :operation_time, :time
  end
end
