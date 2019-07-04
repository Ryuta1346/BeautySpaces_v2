class AddOperationTimeToSalonsReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :salons_reservations, :operation_time, :integer
  end
end
