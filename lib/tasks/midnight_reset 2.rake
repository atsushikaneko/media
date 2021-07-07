desc "yahooをスクレイピング"
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
  url = array[i][4]
  Topic.create(picture:picture,title:title,media:media,time:time,url:url)
end

   p "ここまでOK"
end
