class Product < ActiveRecord::Base
	
	has_many :orders
	has_many :product_categories
	has_many :categories, through: :product_categories
	has_many :comments
	
	
	validates :product_name, presence: true
	validates :description, presence: true
	
	validates :product_number, presence: true, length: {minimum: 3, maximum: 10}
	validates :product_number, uniqueness: { case_sensitive: false }
	
	validates :price, presence: true
	
	def average_stars
		comments.average(:star)
	end

	SIZES = ["None", "Small", "Medium", "Large", "X-Large"]

end