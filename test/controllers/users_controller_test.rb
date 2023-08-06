require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    @user1 = users(:one) 
    @user2 = users(:two)
    @post = posts(:one)
    @comment = comments(:one)
    sign_in @user1
  end

  test "profile view shows own posts" do
    get user_path(@user1)
    assert_select "p", "This is a post"
  end


end
