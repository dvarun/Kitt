require 'test_helper'

class NotificationTest < ActionMailer::TestCase
  test "user_created" do
    mail = Notification.user_created
    assert_equal "User created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
