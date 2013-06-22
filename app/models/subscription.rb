class Subscription
	include Mongoid::Document
  include Mongoid::Timestamps

  field :is_active, type: Boolean
  field :price, type: BigDecimal
  field :start_date, type DateTime
  field :end_date, type DateTime

  attr_accessible :box_id, :user_id, :is_active

  validates_presence_of :price, :start_date, :is_active, :box_id, :user_id

  belongs_to :box
  belongs_to :user # only if the user is a customer
end