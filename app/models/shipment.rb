class Shipment
	include Mongoid::Document
  include Mongoid::Timestamps

  field :desc,          type: String
  field :first_name,    type: String
  field :last_name,     type: String
  field :address,       type: String
  field :city,          type: String
  field :state,         type: String
  field :zip,           type: String
  field :phone,         type: String
  field :ship_date,     type: DateTime
  field :has_shipped,   type: Boolean

  validates_presence_of :desc, :ship_date, :has_shipped
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