class Like < ApplicationRecord
  belongs_to :user
  belongs_to :blog, counter_cache: :likes_count
end
