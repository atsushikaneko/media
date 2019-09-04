class TweetsController < ApplicationController
  before_action :set_twitter_client

  def update
    @twitter.update("テスト1\nブログのためテストしています。(後で消します)")
    render plain: "Twitter.update"
  end

  private

  def set_twitter_client
    @twitter = Twitter::REST::Client.new do |config|
      config.consumer_key        = "iP6AflbMsoA4CRTbukq0LpkCP"
      config.consumer_secret     = "kBIBzQ33L1QgnoduchAM5IYxN0EdPsxdid9z9rVMW2y03n5I1M"
      config.access_token        = "1131074354840604672-46g0tIHXceYZz3GNF3e1stdLHIzbBn"
      config.access_token_secret = "U8mC5OiTDjgX2abiTt0HMKYFwsktdZJZGoanNYGVSEFcL"
    end
  end
end