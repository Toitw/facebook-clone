require "test_helper"

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "body is required" do
    comment = Comment.new
    assert_not comment.save
  end

end
