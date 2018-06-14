class ModifyDeletedFromDesctipdionDetail < ActiveRecord::Migration[5.0]
  def change
    remove_column :description_details, :deleted, :boolean

    add_column :description_details, :deleted_at, :datetime
    add_index :description_details, :deleted_at
  end
end
