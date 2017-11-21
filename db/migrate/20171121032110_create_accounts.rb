class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.integer :entity_id
      t.string :entity_type
      t.decimal :balance

      t.timestamps
    end
  end
end
