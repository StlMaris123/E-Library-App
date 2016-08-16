class AddOverDueToLeases < ActiveRecord::Migration[5.0]
  def change
    add_column :leases, :over_due, :datetime
  end
end
