# == Schema Information
#
# Table name: districts
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  phone      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class District < ActiveRecord::Base
  has_and_belongs_to_many :notifications
end
