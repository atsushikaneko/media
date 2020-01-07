class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]


  def index
  end

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs.paginate(page: params[:page])
  end


  def new
    @user = User.new
  end

  def create
   @user = User.new(user_params)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = "登録されたEメールアドレスに確認用メールをお送りいたしました。"
      redirect_to root_url
    else
      render 'new'
    end
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      flash[:info] = "更新できてない"  #検証用
      render "edit"
    end
  end

#ユーザーフォロー機能関係
def following
  @title = "Following"
  @user  = User.find(params[:id])
  @users = @user.following.paginate(page: params[:page])
  render 'show_follow'
end

def followers
  @title = "Followers"
  @user  = User.find(params[:id])
  @users = @user.followers.paginate(page: params[:page])
  render 'show_follow'
end


end

private
def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end


# beforeアクション

#パラメータのユーザーIDがログインユーザーと一致しなかったらrootURLにリダイレクト
def correct_user
  @user = User.find(params[:id])
  redirect_to(root_url)
end

#logged_in_userメソッドはapplication_controllerに移動
# ログインしてない場合、そのURLを保存して、ログインフォームに飛ばす
#def logged_in_user
#  unless logged_in?
#    store_location
#    flash[:danger] = "Please log in."
#    redirect_to login_url
#  end
#end
