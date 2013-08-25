class Cause < ActiveRecord::Base
  attr_accessible :access_token, :rally_id

  validates :access_token, presence: true, length: { is: 40, message: "Key is 40 characters in length." }
  validates :rally_id, presence: true, length: { is: 11, message: "Id is 11 characters in length"}, uniqueness: [true, message: "Cause is already added."]
  
  before_save :verify_authenticity

  def verify_authenticity
  	
  end

  def sync(json)
	debugger
  end
end
