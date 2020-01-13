require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  #有効な編集withフレンドリーフォワーディング
  test "successful edit with friendly forwarding" do
    #ログインしてない状態でuserのeditにアクセス
    get edit_user_path(@user)
    log_in_as(@user)
    #ログインした状態でuserのeditにアクセス
    assert_redirected_to edit_user_url(@user)
    name  = "Foo Bar"
    email = "foo@bar.com"
    #ユーザー情報の編集
    patch user_path(@user), params: { user: { name:  name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    #assert_not flash.empty?
    #assert_redirected_to @user
    #@user.reload
    #assert_equal name,  @user.name
    #assert_equal email, @user.email
  end

end
