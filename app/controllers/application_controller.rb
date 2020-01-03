class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :most_viewed

  private
 def most_viewed
  @most_viewed = Blog.order('impressions_count DESC').take(10)
 end

end
