class AddDueDateToLeases < ActiveRecord::Migration[5.0]
  def change
    add_column :leases, :due_date, :datetime
  end
end
