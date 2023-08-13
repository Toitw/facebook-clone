require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "welcome_email" do
    user = User.create(email: 'testemail@juroga.com', password: 'password', name: 'juroga')
    mail = UserMailer.with(user: user).welcome_email
    assert_equal "Welcome to Odin Facebook", mail.subject
    assert_equal [user.email], mail.to
  end
end
