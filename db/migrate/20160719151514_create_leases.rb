class CreateLeases < ActiveRecord::Migration[5.0]
  def change
    create_table :leases do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :status, default: 0
      t.float :charges

      t.timestamps
    end
  end
end
