class BlogsController < ApplicationController

  def index
    @blogs = Blog.paginate(page: params[:page], per_page: 10)
  end

  def show
  @blog = Blog.find(params[:id])
  @images = @blog.images
  @comment = Comment.new
  @comments = @blog.comments
  end

  def destroy
  @blog = Blog.find(params[:id])
  @blog.destroy
  render "static_pages/setting"
  end

  def new
    @blog = current_user.blogs.build
    #@blog.images.build
  end


  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      flash[:success] = "Blog created!"
      redirect_to current_user
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


  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @blogs = Blog.search(params[:search])
  end


private
  def blog_params
    params.require(:blog).permit(:title,:content,:category,:picture, images_attributes:{ picture:[]} )
  end

end
