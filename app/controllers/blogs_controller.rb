class BlogsController < ApplicationController
  
  
  def new
    @blog = Blog.new
    #@blog.images.build
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
  @blog = Blog.find(params[:id])
  @images = @blog.images
  end
  
end


private
  def blog_params
    params.require(:blog).permit(:title,:content,:category,:picture, images_attributes:{ picture:[]} )
  end