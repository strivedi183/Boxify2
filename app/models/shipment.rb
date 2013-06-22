class Shipment
	include Mongoid::Document
  include Mongoid::Timestamps

  field :desc, type: String
  field :ship_date, type: DateTime
  field :has_shipped, type: Boolean

  validates_presence_of :name, :ship_date, :has_shipped
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