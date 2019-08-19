class AddPictureToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :picture, :string
  end
end
