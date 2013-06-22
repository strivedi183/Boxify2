class Box
	include Mongoid::Document
  include Mongoid::Timestamps

  field :img_lg, type: String
  field :img_sm, type: String
  field :name, type: String
  field :description, type: String
  field :frequency, type: String
  field :price, type: BigDecimal
  field :items, type: Array # used to match with Users (interests from User)

  attr_accessible :user_id, :name, :description, :ship_date, :frequency, :price, 
                  :img_lg, :img_sm, :items
  
  validates_presence_of :name, :description, :frequency, :price, :items

  belongs_to :user # only if a user creates it (is a merchant)
  has_many :subscriptions

  # def is_subscribed?(user)
  #   user.id.in?(self.subscriptions.map(&:user_id))
  # end

  # def is_owner?(user)
  #   user == self.user
  # end

  # def current_shipment
  #   if self.shipments.where(:has_shipped => false).last.present?
  #     self.shipments.where(:has_shipped => false).last
  #   end
  # end

  # def last_shipment_sent
  #   if self.shipments.where(:has_shipped => true).order(:created_at).reverse.last.present?
  #     self.shipments.where(:has_shipped => true).order(:created_at).reverse.last
  #   end
  # end
end