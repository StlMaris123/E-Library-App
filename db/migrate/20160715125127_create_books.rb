class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.integer :ISBN
      t.string :title
      t.string :description
      t.integer :quantity

      t.timestamps
    end
  end
end
