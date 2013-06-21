class Customer < User
	include Mongoid::Document
  include Mongoid::Timestamps
  
  def customer?
    true
  end
end