class Product < ActiveRecord::Base
	has_many :orders
	
	has_many :product_categories
	
	has_many :comments
	
	has_many :categories, through: :product_categories
	
	validates :product_name, presence: true
	validates :description, presence: true
	
	def average_stars
		comments.average(:star)
	end
end
