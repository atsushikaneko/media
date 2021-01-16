class AddUrlToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :url, :string
  end
end
