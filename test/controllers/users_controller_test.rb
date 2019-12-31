require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
     @user = users(:michael)
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should get show" do
    get user_url @user
    assert_response :success
  end

end
