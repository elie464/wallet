class ChangeColumnDefaults < ActiveRecord::Migration[5.1]
  def change
    change_column_null :entities, :type, false
    change_column_null :accounts, :entity_id, false
    change_column_null :accounts, :entity_type, false
    change_column :accounts, :balance, :decimal, :precision => 10, :scale => 2, :null => false, :default => 0
    change_column_null :transactions, :account_id, false
    change_column :transactions, :amount, :decimal, :precision => 10, :scale => 2, :null => false, :default => 0
    change_column_null :transactions, :direction, false
  end
end
