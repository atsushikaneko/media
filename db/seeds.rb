# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#ブログ
#20.times do |n|
#  content  = "content#{n+1}"
#  title = "title#{n+1}"
#  category = "犬"
#  User.create!(content:content,
#              title: title,
#              category: category)
#end

# 画像
#users = User.order(:created_at).take(6)
#3.times do
#  content = Faker::Lorem.sentence(5)
#  users.each { |user| user.microposts.create!(picture: picture) }
#end

# ユーザー
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             blogtitle: "ブログタイトルがここにきます",
             password:              "foobar",
             password_confirmation: "foobar",
            # admin:     true,
             activated: true,
             activated_at: Time.zone.now,
             profile_text: "プロフィール文章がここにきます",
             profile_image: open("#{Rails.root}/app/assets/images/profile.jpg"))

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               blogtitle: "#{name}のブログ",
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now,
               profile_text: "プロフィール文章がここにきます",
               profile_image: open("#{Rails.root}/app/assets/images/profile.jpg"))
end

# 記事
users = User.order(:created_at).take(6)
50.times do
  content = "記事文章がここにきます"
  users.each { |user| user.blogs.create!(title: "記事タイトルがここにきます",content: content,category: "カテゴリーがここにきます", picture: open("#{Rails.root}/app/assets/images/seeds/image#{rand(1..31)}.jpg")) }
end

# フォロー関係
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
