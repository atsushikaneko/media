class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.integer :blog_id
      t.text :picture

      t.timestamps
    end
  end
end
