class ShipmentsController < ActionController::Base
	before_filter :authenticate_user!
	load_and_authorize_resource # to load in CanCan permissions

	def index
		if params[:filter] == "All" # create this
			@shipments = Shipment.all
		elsif params[:filter] == "Shipped"
			@shipments = # shipments that have shipped
		else
			@shipments = # shipments that have not yet shipped
		end		
	end
end