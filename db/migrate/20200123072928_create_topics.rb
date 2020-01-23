class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :title
      t.string :picture
      t.string :time
      t.string :media

      t.timestamps
    end
  end
end
