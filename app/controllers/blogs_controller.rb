class BlogsController < ApplicationController
  
  
  def new
    @blog = Blog.new
  end
  
  
  def create
    blog = Blog.new(blog_params)
    if blog.save
      redirect_to root_url
      
    else
      render 'new'
    end  
  end
  
  
  def edit
  end

  def index
  end

  def show
  @most_viewed = Blog.order('impressions_count DESC').take(10)
  end
  
end


private
  def blog_params
    params.require(:blog).permit(:title,:content,:picture)
  end