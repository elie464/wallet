class ChangeNullsToTransactions < ActiveRecord::Migration[5.1]
  def change
    change_column_null :transactions, :source_id, true
    change_column_null :transactions, :target_id, true
  end
end
