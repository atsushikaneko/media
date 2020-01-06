class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :most_viewed

  private
 def most_viewed
  @most_viewed = Blog.order('impressions_count DESC').take(10)
 end

 # ユーザーのログインを確認する
 def logged_in_user
   unless logged_in?
     store_location
     flash[:danger] = "Please log in."
     redirect_to login_url
   end
 end
 
end
