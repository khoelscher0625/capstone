class RemoveGradeFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :grade, :decimal
  end
end
