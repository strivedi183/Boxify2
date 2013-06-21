class Merchant < User
	include Mongoid::Document
  include Mongoid::Timestamps
  
  def merchant?
    true
  end
end