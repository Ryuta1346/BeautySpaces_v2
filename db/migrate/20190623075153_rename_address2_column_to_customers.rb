class RenameAddress2ColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :address2, :city
  end
end
