class SubscriptionsController < ApplicationController
	before_filter :authenticate_user!
  # load_and_authorize_resource # to load in CanCan permissions

  def index
    if params[:filter] == nil || params[:filter] == "All"
      @subscriptions = Subscription.all
    elsif params[:filter] == "Shipped"
      @subscriptions = Subscription.where(has_shipped: true)# items that have shipped
    else
      @subsciptions = Subscription.where(has_shipped: false) # items that haven't shipped yet
    end
  end

  def show
    @subscription = Subscription.find(params[:id])
  end

  def new
    @subscription = Subscription.new
    @box = Box.find(params[:format])
  end

  def create
    subscription = Subscription.create
    subscription.user = current_user
    subscription.box = Box.find(params[:box_id])

    # stripe
    subscription.save
    redirect_to boxes_path
  end

  def edit
    @subscription = Subscription.find(params[:id])
    @box = @subscription.box
  end

  def update
    subscription = Subscription.find(params[:id])
    if subscription.user == @current_user
      subscription.update_attributes(params[:subscription])
    end
    redirect_to subscription
  end
  
  def destroy
  end
end