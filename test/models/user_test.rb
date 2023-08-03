require "test_helper"

class UserTest < ActiveSupport::TestCase

include Devise::Test::IntegrationHelpers

  # test "the truth" do
  #   assert true
  # end
  test "name is required" do
    user = User.new
    assert_not user.save
  end

  test "name field is shown in the registration view" do
    get new_user_registration_path
    assert_select "input[name=?]", "user[name]"
  end
end
