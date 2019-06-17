class RenameEndingTimeColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :ending_time, :closing_time
  end
end
