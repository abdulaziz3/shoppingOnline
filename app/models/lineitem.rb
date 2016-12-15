class Lineitem < ActiveRecord::Base
	belongs_to :cart
	belongs_to :product
	#belongs_to :order

end