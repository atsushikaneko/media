class AddIndexToBlog < ActiveRecord::Migration[5.1]
  def change
    add_index :blogs, [:user_id, :created_at]
  end
end
