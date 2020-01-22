require 'test_helper'

class BlogsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @blog = blogs(:blog1)
    @user = users(:michael)
  end


   #ブログ投稿画面は表示するか
   test "should get new" do
    get signup_path
    assert_response :success
  end


  #ブログ一覧画面は表示するか
  test "should get index" do
    get root_path
    assert_response :success
  end


end
