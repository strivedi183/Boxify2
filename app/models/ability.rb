class Ability
  include CanCan::Ability

  def initialize(user)
    # initialize user
  end

  def customer
    can :manage, Subscription
  end

  def merchant
    can :manage, Box
    can :manage, Shipment
  end

  def admin
    can :manage, :all
  end
end