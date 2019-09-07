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
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(blog_params)
      redirect_to @blog
    else
      render "edit"
    end
  end
  
  def index
  end

  def show
  @blog = Blog.find(params[:id])
  @images = @blog.images
  end


  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @blogs = Blog.search(params[:search])
  end  


private
  def blog_params
    params.require(:blog).permit(:title,:content,:category,:picture, images_attributes:{ picture:[]} )
  end
  
end