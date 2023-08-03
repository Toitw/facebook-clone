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

end
