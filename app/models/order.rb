class Order < ActiveRecord::Base
	
	has_many :orderProducts
	
	belongs_to :customer
	
end
