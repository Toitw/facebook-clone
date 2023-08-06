require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  
    include Devise::Test::IntegrationHelpers
  
    setup do
      @user1 = users(:one) 
      @user2 = users(:two)
      @post = posts(:one)
      @comment = comments(:one)
      sign_in @user1
    end
    
    test "should create comment" do
      assert_difference('Comment.count') do
        post comments_path, params: { comment: { content: @comment.content, post_id: @post.id, user_id: @user1.id } }
      end

      assert_redirected_to posts_path
    end
  
    test "should update comment" do
      patch comment_path(@comment), params: { comment: { id: @comment.id, content: @comment.content, post_id: @post.id, user_id: @user1.id } }
      assert_redirected_to posts_path
    end
  
    test "should destroy comment" do
      assert_difference('Comment.count', -1) do
        delete comment_path(@comment), params: { comment: { id: @comment.id, content: @comment.content, post_id: @post.id, user_id: @user1.id } }
      end

      assert_redirected_to posts_path
    end

    test "should not destroy comment if not owner" do
      sign_out @user1
      sign_in users(:two)
      assert_no_difference('Comment.count') do
        delete comment_path(@comment), params: { comment: { id: @comment.id, content: @comment.content, post_id: @post.id, user_id: @user1.id } }
      end

      assert_redirected_to posts_path
    end
  end