class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
    	t.string :book_name
    	t.integer :category_id
    	t.text :description

      t.timestamps null: false
    end
  end
end
