class AddBlogtitleToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :blogtitle, :string
  end
end
