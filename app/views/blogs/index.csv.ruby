require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(title category content created_at updated_at impressions_count likes_count)
  csv << csv_column_names
  @blogs.where(user_id:current_user.id).pluck(*csv_column_names).each do |blog|
    csv << blog
  end
end
