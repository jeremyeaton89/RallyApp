class Cause < ActiveRecord::Base
  attr_accessible :access_token

  validates presence: :access_token
end
