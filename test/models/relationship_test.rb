require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  def setup
    @relationship = Relationship.new(follower_id: users(:michael).id,
                                     followed_id: users(:archer).id)
  end

  #有効なリレーションシップがちゃんと通るか
  test "should be valid" do
    assert @relationship.valid?
  end

  #無効なリレーションシップ(follower_idがnil)をちゃんと弾くか
  test "should require a follower_id" do
    @relationship.follower_id = nil
    assert_not @relationship.valid?
  end

  #無効なリレーションシップ(followed_idがnil)をちゃんと弾くか
  test "should require a followed_id" do
    @relationship.followed_id = nil
    assert_not @relationship.valid?
  end
end
