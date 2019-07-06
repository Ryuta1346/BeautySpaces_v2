class ChangeCustomerColumnOnStylistsReservations < ActiveRecord::Migration[5.2]
  def up
    change_column_null :stylists_reservations, :customer_id, false, 0
  end

  def down
    change_column_null :stylists_reservations, :customer_id, true, nil
  end
end