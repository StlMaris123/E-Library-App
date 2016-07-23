class ChangeBookIsbnToString < ActiveRecord::Migration[5.0]
  def change
    change_column :books, :ISBN, :string
  end
end
