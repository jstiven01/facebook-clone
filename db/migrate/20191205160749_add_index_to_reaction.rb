class AddIndexToReaction < ActiveRecord::Migration[5.2]
  def change
    add_index :reactions, [:user_id, :post_id], unique: true
  end
end
