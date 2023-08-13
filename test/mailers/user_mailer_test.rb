require "test_helper"

class UserMailerTest < ActionMailer::TestCase

  include Devise::Test::IntegrationHelpers

  test "welcome_email" do
    user = User.create(email: 'testemail@juroga.com', password: 'password', name: 'juroga')
    mail = UserMailer.with(user: user).welcome_email
    assert_equal "Welcome to Odin Facebook", mail.subject
    assert_equal [user.email], mail.to
  end

  test 'welcome email is sent' do
    user = User.create(email: 'testemail2@juroga.com', password: 'password', name: 'juroga2')
    email = UserMailer.with(user: user).welcome_email

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['odinfacebook@juroga.com'], email.from
    assert_equal [user.email], email.to
    assert_equal 'Welcome to Odin Facebook', email.subject
  end
end
