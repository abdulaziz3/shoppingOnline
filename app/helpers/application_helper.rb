module ApplicationHelper
	
	def signed_in?
		if session[:customer_id].nil?
			return
		else
			@current_customer = Customer.find_by_id(session[:customer_id])
		end
	end
	
	def euro(amount)
		number_to_currency(amount, :unit => '€')
	end
	
	def gravatar_for(customer, options = { size: 80})
		gravatar_id = Digest::MD5::hexdigest(customer.email.downcase)
		size = options[:size]
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: customer.email, class: "img-circle")
	end
	
	def cc_years
		yrs = []
		year_today = Date.today.strftime("%y").to_i
		year_today.upto(year_today+10).each do |y| yrs << y.to_s;end
		return yrs
	end
	
	def cc_months
		['01','02','03','04','05','06','07','08','09','10','11','12']
	end
end
