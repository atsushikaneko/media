# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#ブログ
20.times do |n|
  content  = "content#{n+1}"
  title = "title#{n+1}"
  category = "犬"
  User.create!(content:content,
              title: title,
              category: category)
end

# 画像
users = User.order(:created_at).take(6)
3.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(picture: picture) }
end