class CardsController < ApplicationController
	before_action :authorise
	
	def create
		@customer = Customer.find params[:customer_id]
		@card = @cusotmer.card.new(card_params)
		@card.user_id = @current_customer.id
		@card.save
		
		respond_to do |format|
			format.html{redirect_to @customer}
		end
	end
	
	private
	def card_params
		params.require(:card).permit(:card_holder, :card_no, :ccv_no, :exp_date, :customer_id)
	end
end
