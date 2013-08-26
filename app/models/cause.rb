class Cause < ActiveRecord::Base
  attr_accessible :access_token, :rally_id

  validates :access_token, presence: true
  validates :rally_id, presence: true, uniqueness: { message: "already added." }  

    def sync
      url = Addressable::URI.new(
       :scheme => "https",
       :host => "rally.org",
       :path => "api/causes/#{self.rally_id}",
       :query_values => {:access_token => self.access_token}
      ).to_s

      data = JSON.parse(RestClient.get(url))
      self.name = data["name"]
      self.total_raised = data["total_raised"].to_i
      self.current_fundraising_goal = data["current_fundraising_goal"].to_i
      self.image_url = data["image_url"]
      self.save
    end
end
