require "test_helper"

class FriendRequestsControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one) 
    sign_in @user
  end

  test "should get index" do
    get friend_requests_path
    assert_response :success
  end

  test "should create friend request" do
    recipient = users(:two)
    post friend_requests_path(recipient_id: recipient.id)
    assert_response :redirect
  end
  

  test "should update friend request" do
    friend_request = friend_requests(:one) 
    patch friend_request_path(friend_request)
    assert_response :redirect
  end
  

  test "should destroy friend request" do
    friend_request = friend_requests(:one) # Assuming you have a fixture or factory for friend_requests
    delete friend_request_path(friend_request)
    assert_response :redirect
  end
  
  test "should destroy friend request" do
    friend_request = friend_requests(:one)
    assert_difference('FriendRequest.count', -1) do
      delete friend_request_path(friend_request)
    end

    assert_redirected_to '/users'
    assert_equal 'Friend request rejected.', flash[:notice]
  end
end
