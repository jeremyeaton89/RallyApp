class DonorsController < ApplicationController

	def index
		url = Addressable::URI.new(
	   :scheme => "https",
	   :host => "rally.org",
	   :path => "api/causes/1LlhOkcgMIG/top_donors",
	   :query_values => {:access_token => "FLQleTAlvZT7CKn3mwNjXbao5poYo71tadi6XOlT"}
 		).to_s

		@donors = JSON.parse(RestClient.get(url))

		url = Addressable::URI.new(
	   :scheme => "https",
	   :host => "rally.org",
	   :path => "api/causes/1LlhOkcgMIG",
	   :query_values => {:access_token => "FLQleTAlvZT7CKn3mwNjXbao5poYo71tadi6XOlT"}
 		).to_s

		@cause = JSON.parse(RestClient.get(url))
		render :index
	end

end
