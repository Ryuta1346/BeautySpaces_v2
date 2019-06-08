class AddAddressToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :address1, :string
    add_column :customers, :address2, :string
  end
end
