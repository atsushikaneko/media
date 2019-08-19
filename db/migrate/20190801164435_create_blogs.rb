class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.integer :user_id
      t.text :content
      t.text :title
      t.text :category

      t.timestamps
    end
  end
end
