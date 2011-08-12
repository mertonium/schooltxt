# == Schema Information
#
# Table name: notifications
#
#  id         :integer         not null, primary key
#  message    :string(255)
#  sent_at    :datetime
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
