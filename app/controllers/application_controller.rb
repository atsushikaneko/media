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
     flash[:danger] = "ログインしてください。"
     redirect_to login_url
   end
 end

#　URLのユーザーIDとログインしているユーザーが一致しなければルートへ
 def correct_user
   @user = User.find(params[:id])
   redirect_to(root_url) unless @user == current_user
 end

 def correct_user_for_blogs
   @user = User.find(params[:user_id])
   redirect_to(root_url) unless @user == current_user
 end

end
