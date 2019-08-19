class StaticPagesController < ApplicationController
  
  def home
    @blogs = Blog.all
    @most_viewed = Blog.order('impressions_count DESC').take(10)
  end

  def about
  end
  
  def contact
  end  
  
  def help
  end  
  
end
