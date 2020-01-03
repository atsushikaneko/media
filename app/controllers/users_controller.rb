class UsersController < ApplicationController

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

  end


end

private
def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end
