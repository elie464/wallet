class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :account_id
      t.decimal :amount
      t.integer :direction

      t.timestamps
    end
  end
end
