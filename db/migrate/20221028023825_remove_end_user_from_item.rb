class RemoveEndUserFromItem < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :end_user_id, :integer
  end
end
