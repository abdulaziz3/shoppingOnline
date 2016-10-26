class Order < ActiveRecord::Base
	has_many :orderproducts
	
	belongs_to :customer
	
end
