class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    def change
    rename_column :books, :title, :name
  end
  end
end
