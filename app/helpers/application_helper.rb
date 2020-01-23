module ApplicationHelper

  require 'nokogiri'
  require 'open-uri'


  def yahoo(url)
  # 変数宣言
  charset = nil
  # webページにアクセスし、HTMLを取得
  html = open(url) do |f|
    charset = f.charset # 文字種別を取得
    f.read               # htmlを読み込んで変数htmlに渡す
  end
  # nokogiriで扱えるように取得したHTMLを変換

  doc = Nokogiri::HTML.parse(html, nil, charset)

  array =[]
  news = []
  10.times do |i|
  array << doc.xpath("//li[contains(@class,'newsFeed_item')][#{i+1}]/a/div/div/div/picture/source[@type='image/webp']/@srcset").inner_text
  array << doc.xpath("//li[contains(@class,'newsFeed_item')][#{i+1}]/a/div/div/div/text()").inner_text
  array << doc.xpath("//li[contains(@class,'newsFeed_item')][#{i+1}]/a/div/div/div/div/span").inner_text
  array << doc.xpath("//li[contains(@class,'newsFeed_item')][#{i+1}]/a/div/div/div/div/time").inner_text
  news << array
  array = []
 end

  news
  end


end
