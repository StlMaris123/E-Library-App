class AddIndexToLeases < ActiveRecord::Migration[5.0]
  def change
    add_index :leases, [:user_id, :book_id], unique: true
  end
end
