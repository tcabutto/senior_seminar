require 'test_helper'

class SignupNotifierMailerTest < ActionMailer::TestCase
  test "business" do
    mail = SignupNotifierMailer.business
    assert_equal "Business", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "personnel" do
    mail = SignupNotifierMailer.personnel
    assert_equal "Personnel", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
