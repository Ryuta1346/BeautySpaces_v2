class AddColumnToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :finish_salon, :boolean, null: false, default: false
    add_column :reservations, :finish_stylist, :boolean, null: false, default: false
    add_column :reservations, :salon_memo, :text
    add_column :reservations, :stylist_memo, :text
  end
end
