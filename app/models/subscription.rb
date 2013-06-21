class Subscription
	include Mongoid::Document
  include Mongoid::Timestamps

  field :is_active, type: Boolean
  field :price, type: BigDecimal

  attr_accessible :box_id, :user_id, :is_active
  belongs_to :box
  belongs_to :user # only if the user is a customer
end