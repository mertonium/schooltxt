class User < ActiveRecord::Base
  has_many :notification
end
