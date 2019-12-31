require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  #無効な情報で登録してみる
  test "invalid signup information" do
    get signup_path
    #無効な譲歩で登録してみて通らないか
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    # users/newにリダイレクトされるか
    assert_template 'users/new'
  end

end
