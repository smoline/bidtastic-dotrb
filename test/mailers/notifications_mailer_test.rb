require 'test_helper'

class NotificationsMailerTest < ActionMailer::TestCase
  test "pre_auction_report" do
    mail = NotificationsMailer.pre_auction_report(Item.all, users(:one))
    assert_equal "Pre auction report", mail.subject
    assert_equal ["MyString"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "outbid" do
    mail = NotificationsMailer.outbid
    assert_equal "Outbid", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "final_tally" do
    mail = NotificationsMailer.final_tally
    assert_equal "Final tally", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
