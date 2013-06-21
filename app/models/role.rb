class Role
	include Mongoid::Document
  include Mongoid::Timestamps

  has_and_belongs_to_many :users

  # _id: 51c3a5f32986cb13a7000001 = Admin
  # _id: 51c3a61d2986cb13a7000002 = Customer
  # _id: 51c3a6222986cb13a7000003 = Merchant
end