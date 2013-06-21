class Shipment
	include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :ship_date, type: DateTime
  field :has_shipped, type: Boolean

  belongs_to :subscripton
  belongs_to :user # only if user is a customer

  def has_shipped?
    if self.ship_date < Date.current
      self.has_shipped == true
    else
      self.has_shipped == false
    end
  end
 end