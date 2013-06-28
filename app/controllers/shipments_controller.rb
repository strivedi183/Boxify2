class ShipmentsController < ApplicationController
	before_filter :authenticate_user!
	# load_and_authorize_resource # to load in CanCan permissions

	def index
		if params[:filter] == "All" || params[:filter] == nil # create this
			@shipments = Shipment.all # filter this by user_id
		elsif params[:filter] == "Shipped"
			@shipments = Shipment.where(has_shipped: true)
		else
			@shipments = Shipment.where(has_shipped: false)
		end
	end

	def create
		shipment = Subscription.create
    shipment.user = current_user
    shipment.box = Box.find(params[:box_id])
    shipment.address = current_user.address
    shipment.city = current_user.city
    shipment.state = current_user.state
    shipment.zip = current_user.zip
    shipment.phone = current_user.phone

    shipment.save
    redirect_to subscriptions_path
	end

	def edit
		@shipment = Shipment.where(id: params[:id])
	end
end