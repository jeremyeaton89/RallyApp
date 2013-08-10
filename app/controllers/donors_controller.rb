require 'addressable/uri'

class DonorsController < ApplicationController

	def index
		url = Addressable::URI.new(
	   :scheme => "https",
	   :host => "rally.org",
	   :path => "api/causes/1LlhOkcgMIG/donations",
	   :query_values => {:access_token => "FLQleTAlvZT7CKn3mwNjXbao5poYo71tadi6XOlT"}
 		).to_s

 		response = RestClient.get(url)

		@donations = []

		JSON.parse(response).each do |data|
			@donations << {
				name: data["first_name"] + " " + data["last_name"],
				donation: data["amount_cents"],
				zipcode: data["address_zip"]
			}
		end

		render :index
	end

end
