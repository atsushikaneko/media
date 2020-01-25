class BlogsController < ApplicationController
  before_action :logged_in_user, only: [:edit,:update,
                                        :new,:create,
                                        :destroy,]
  before_action :correct_user_for_blogs,   only: [:edit, :update]

  def index
    @blogs = Blog.all.unscope(:order) #なぜか一度unscopeで並び順をリセットしないといけないみたい
    @polular_blogs = @blogs.order('impressions_count DESC')
    @recent_blogs = @blogs.order('created_at DESC')
    @yahoo_news = Topic.all[0..9].reverse
    respond_to do |format|
      format.html do
          #html用の処理を書く
      end
      format.csv do
    #csv用の処理を書く
    send_data render_to_string, filename: "all_posts.csv", type: :csv
      end
    end
  end


  def show
  @blog = Blog.find(params[:id])
  @user = User.find(params[:user_id])
  @polular_blogs = Blog.where(user_id:@user.id).unscope(:order).order('impressions_count DESC')
  @recent_blogs = Blog.where(user_id:@user.id).unscope(:order).order('created_at DESC')
  @images = @blog.images
  @comment = Comment.new
  @comments = @blog.comments
  #以下で条件分岐しないと、例えば /users/1/blogs/5のとき
  #user1がblog5を持ってなくてもとりあえず表示されちゃう
  unless @user.blogs.include?(@blog)
    redirect_to  user_path @user
  end
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
