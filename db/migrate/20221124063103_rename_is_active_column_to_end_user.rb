class RenameIsActiveColumnToEndUser < ActiveRecord::Migration[6.1]
  def change
    change_column :end_users, :is_active, :boolean, default: true
  end
end
