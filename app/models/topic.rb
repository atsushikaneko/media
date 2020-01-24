class Topic < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
end
