class CreateBookNames < ActiveRecord::Migration[5.2]
  def change
    create_table :book_names do |t|
      t.string :title
      t.string :author
      t.text :description
      t.decimal :grade
      t.string :level
      t.integer :user_id
      t.timestamps
    end
    add_index :book_names, :user_id
  end
end
