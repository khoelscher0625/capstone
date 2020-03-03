class ChangeBookNamesToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_table :book_names, :books
  end
end
