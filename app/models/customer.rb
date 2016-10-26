class Customer < ActiveRecord::Base
	has_secure_password
	
	validates :email, uniqueness: true
	validates :email, presence: true
	
	validates :f_name, presence: true
	validates :l_name, presence: true
end
