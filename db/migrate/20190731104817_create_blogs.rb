class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.integer :user_id
      t.string :content
      t.string :title
      t.string :category

      t.timestamps
    end
  end
end
