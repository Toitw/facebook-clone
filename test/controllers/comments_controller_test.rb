require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  
    include Devise::Test::IntegrationHelpers
  
    setup do
      @user = users(:one) 
      @post = posts(:one)
      @comment = comments(:one)
      sign_in @user
    end
    
    test "should create comment" do
      assert_difference('Comment.count') do
        post comments_path, params: { comment: { content: @comment.content, post_id: @post.id, user_id: @user.id } }
      end

      assert_redirected_to posts_path
    end
  
    test "should update comment" do
      patch comment_path(@comment), params: { comment: { id: @comment.id, content: @comment.content, post_id: @post.id, user_id: @user.id } }
      assert_redirected_to posts_path
    end
  
    test "should destroy comment" do
      assert_difference('Comment.count', -1) do
        delete comment_path(@comment), params: { comment: { id: @comment.id, content: @comment.content, post_id: @post.id, user_id: @user.id } }
      end

      assert_redirected_to posts_path
    end
  end