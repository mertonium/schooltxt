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

class Notification < ActiveRecord::Base
  has_and_belongs_to_many :districts
end
