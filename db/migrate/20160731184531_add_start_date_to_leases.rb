class AddStartDateToLeases < ActiveRecord::Migration[5.0]
  def change
    add_column :leases, :start_date, :datetime
  end
end
