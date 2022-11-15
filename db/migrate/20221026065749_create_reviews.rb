class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :end_user_id
      t.integer :item_id
      t.text :content
      t.integer :evaluation
      t.timestamps
    end
  end
end
