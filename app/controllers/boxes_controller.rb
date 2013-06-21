class BoxesController < ApplicationController
	before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource # to load in CanCan permissions

  # before_filter :current_user, 

  def index
    if params[:tag]
      @boxes = Box.tagged_with(params[:tag])
    else
      @boxes = Box.all
    end
  end

  def show
    @box = Box.find(params[:id])
  end

  def new
    @box = Box.new
  end

  def create
    box = Box.create(params[:box])
    box.user = current_user
    box.save
    redirect_to box
  end

  def edit
    @box = Box.find(params[:id])
  end

  def update
    box = Box.find(params[:id])
    if box.user == @current_user
      box.update_attributes(params[:box])
    end
    redirect_to box
  end

  def destroy
  end
  
  def purchase
    box = Box.find(params[:id])

    begin
      if current_user.cc_id.nil?
        customer = Stripe::Customer.create(email: current_user.email, card: params[:token])
        current_user.cc_id = customer.id
        current_user.save
      end
      Stripe::Charge.create(customer: current_user.cc_id, amount: (box.price * 100).to_i, description: box.name, currency: 'usd')
      subscription = Subscription.create
      subscription.box = box
      subscription.user = current_user
      subscription.save
    rescue Stripe::CardError => @error
    end

    # if @error.nil?
    #   #Notifications.purchased_product(@auth, product).deliver
    #   # result = Result.create(:user_id => current_user.id, :box_id => box.id)
    #   box.purchase(current_user)
    # end

    @boxes = Box.all
  end
end