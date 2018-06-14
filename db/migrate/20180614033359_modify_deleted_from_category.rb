class ModifyDeletedFromCategory < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :deleted, :boolean

    add_column :categories, :deleted_at, :datetime
    add_index :categories, :deleted_at
  end
end
