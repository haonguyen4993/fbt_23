class ModifyDeletedFromTours < ActiveRecord::Migration[5.0]
  def change
    remove_column :tours, :deleted, :boolean

    add_column :tours, :deleted_at, :datetime
    add_index :tours, :deleted_at
  end
end
