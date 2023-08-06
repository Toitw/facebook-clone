require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  
    include Devise::Test::IntegrationHelpers

  setup do
    @user1 = users(:one)
    @post1 = posts(:one)
    sign_in @user1
  end

  test "should create like" do
    assert_difference('Like.count') do
      post likes_url, params: { like: { post_id: @post1.id } }
    end

    assert_redirected_to posts_path
  end

  test "should destroy like" do
    like = Like.create(post: @post1, user: @user1)

    assert_difference('Like.count', -1) do
      delete like_url(like)
    end

    assert_redirected_to posts_path
  end
end