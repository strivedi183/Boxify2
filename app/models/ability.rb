class Ability
  include CanCan::Ability

  def initialize(user)
  	# CanCan authentication
  	if user.role? :admin
  		can :manage, :all
  	elsif user.role? :merchant
  		can # do all other allowed actions
  	else
  		can # subscribe to boxes
  	end
  end
end