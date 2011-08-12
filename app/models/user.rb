# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  phone      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_many :notification
  has_many :district
  attr_accessible :name, :phone
  
  phone_regex = /^(\+(\d)?)?\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
  
  validates :name, :presence => true,
                   :length => { :maximum => 100 }
  validates :phone, :presence => true,
                    :format => { :with => phone_regex },
                    :uniqueness => { :case_sensitive => false }
end
