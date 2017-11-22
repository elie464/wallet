class AddSourceAndTargetToTransactions < ActiveRecord::Migration[5.1]
  def change
    remove_column :transactions, :direction
    remove_column :transactions, :account_id
    add_column  :transactions, :source_id, :integer, :null => false
    add_column  :transactions, :target_id, :integer, :null => false
  end
end
