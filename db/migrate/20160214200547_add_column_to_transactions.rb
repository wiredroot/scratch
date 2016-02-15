class AddColumnToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :shares, :integer
  end
end
