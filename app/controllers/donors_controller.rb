require 'addressable/uri'

class DonorsController < ApplicationController

	def new

	end

	def index
		@causes = []

		[
			# "aFYhplNyi3XBAzurIZXBvDnO32D9Vsh0gKrV0dQk",
			"1PRPzW6N7Jp3qTpZsGcIz6Kh1YLrQySHgmP261fQ",
			"Lb2n3v5C2XdP3LSajEaTCp5tOudRmDxoFeHwbzXA",
			"07Ax5WOhGKc1EOlGwxp2VL8yI7fcPTGcy4Zs1M0A",
			"FLQleTAlvZT7CKn3mwNjXbao5poYo71tadi6XOlT",
			"ElubFnqLoJmg5c8NuKCpeVAPQHPp77DPqvLET6sx"
		].each do |access_token|
			url = Addressable::URI.new(
		   :scheme => "https",
		   :host => "rally.org",
		   :path => "api/causes/",
		   :query_values => {:access_token => access_token}
	 		).to_s

	 		@causes << JSON.parse(RestClient.get(url))
		end			
	end

	def show
		@cause = Cause.find(params[:id]) 
		debugger
		url = Addressable::URI.new(
	   :scheme => "https",
	   :host => "rally.org",
	   :path => "api/causes/#{@cause[:id]}/top_donors",
	   :query_values => {:access_token => @cause}
 		).to_s

		@donors = JSON.parse(RestClient.get(url))



		url = Addressable::URI.new(
	   :scheme => "https",
	   :host => "rally.org",
	   :path => "api/causes/#{@cause[:id]}",
	   :query_values => {:access_token => @cause}
 		).to_s

		@cause.sync JSON.parse(RestClient.get(url))
	end

	def create
		# verify authenticity of access_token
		url = Addressable::URI.new(
		   :scheme => "https",
		   :host => "rally.org",
		   :path => "api/causes/#{params[:cause][:rally_id]}",
		   :query_values => {:access_token => params[:cause][:access_token]}
	 	).to_s

	 	unless JSON.parse(RestClient.get(url))
	 		flash[:error] = "Invalid Authorization Token or Rally Id"
	 		render :new
	 	end

		@cause = Cause.new(params[:cause])
	 	if @cause.save
	 		flash[:notice] = "New Cause Added."
	 		redirect_to donor_url
	 	else
	 		flash[:error] = @cause.errors.full_messages
	 		render :new 
	 	end
	end

end
