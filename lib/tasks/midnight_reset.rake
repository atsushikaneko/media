desc "mode、visit, task, paymentをリセット"
task :tesutodesu => :environment do
  #ログ
  logger = Logger.new 'log/midnight_reset.log'

  #ここから処理を書いていく
  User.find_each {|user| user.update!(blogtitle:"Here is Blog title")}

  #デバッグのため
  p "ここまでOK"
end
