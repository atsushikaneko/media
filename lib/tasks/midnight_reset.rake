desc "mode、visit, task, paymentをリセット"
task :tesutodesu => :environment do
  #ログ
  logger = Logger.new 'log/midnight_reset.log'

  #ここから処理を書いていく
  User.find_each {|user| user.update!(blogtitle:"Here is Blog title")}

  #デバッグのため
  p "ここまでOK"
end

task :scrape => :environment do
  include ApplicationHelper

  logger = Logger.new 'log/midnight_reset.log'

   array = yahoo("https://news.yahoo.co.jp/ranking/access/news")

  p array

10.times do |i|
  picture= array[i][0]
  title = array[i][1]
  media = array[i][2]
  time = array[i][3]
  Topic.create(picture:picture,title:title,media:media,time:time)
end

   p "ここまでOK"
end
