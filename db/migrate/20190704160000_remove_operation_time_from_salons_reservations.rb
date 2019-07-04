class RemoveOperationTimeFromSalonsReservations < ActiveRecord::Migration[5.2]
  def change
    remove_column :salons_reservations, :operation_time, :time
  end
end
