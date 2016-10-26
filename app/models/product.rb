class Product < ActiveRecord::Base
	
	validates :product_name, presence: true
	validates :description, presence: true
	
end
