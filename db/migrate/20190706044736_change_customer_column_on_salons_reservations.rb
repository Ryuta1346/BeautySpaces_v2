class ChangeCustomerColumnOnSalonsReservations < ActiveRecord::Migration[5.2]
  def up
    change_column_null :salons_reservations, :customer_id, false, 0
  end

  def down
    change_column_null :salons_reservations, :customer_id, true, nil
  end
end
