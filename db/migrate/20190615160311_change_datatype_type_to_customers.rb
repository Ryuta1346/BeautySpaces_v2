class ChangeDatatypeTypeToCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column :customers, :type, :integer, using: 'type::integer', null: false, default: 0
  end
end