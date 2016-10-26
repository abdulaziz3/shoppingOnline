module ApplicationHelper
	def signed_in?
		if session[:customer_id].nil?
			return
		else
			@current_customer = Customer.find_by_id(session[:customer_id])
		end
	end
	def eruo(amount)
		number_to_currency(amount, :unit => '€')
	end
end
