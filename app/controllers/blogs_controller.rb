class BlogsController < ApplicationController
  before_action :logged_in_user, only: [:edit,:update,
                                        :new,:create,
                                        :destroy,]
  before_action :correct_user,   only: [:edit, :update]

  def index
    @blogs = Blog.all.unscope(:order) #なぜか一度unscopeで並び順をリセットしないといけないみたい
    @polular_blogs = @blogs.order('impressions_count DESC')
    @recent_blogs = @blogs.order('created_at DESC')
  end


  def show
  @blog = Blog.find(params[:id])
  @user = User.find(params[:user_id])
  @polular_blogs = Blog.where(user_id:@user.id).unscope(:order).order('impressions_count DESC')
  @recent_blogs = Blog.where(user_id:@user.id).unscope(:order).order('created_at DESC')
  @images = @blog.images
  @comment = Comment.new
  @comments = @blog.comments
  end


  def destroy
  @blog = Blog.find(params[:id])
  @blog.destroy
  flash[:info] = "記事を削除しました。"
  redirect_to setting_path
  end


  def new
    @blog = current_user.blogs.build
    #@blog.images.build
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      flash[:success] = "記事を投稿しました。"
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
      redirect_to [@blog.user,@blog]
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
