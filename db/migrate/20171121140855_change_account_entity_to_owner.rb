class ChangeAccountEntityToOwner < ActiveRecord::Migration[5.1]
  def change
    rename_column :accounts, :entity_id, :owner_id
    rename_column :accounts, :entity_type, :owner_type
  end
end
