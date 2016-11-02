class CommentsController < ApplicationController
	before_action :authorise
	
	
	def create
		@product = Product.find params[:product_id]
		@comment = @product.comments.new(comment_params)
		@comment.customer_id = @current_customer.id
		@comment.save
		
		respond_to do |format|
			format.html{ redirect_to @product}
		end 
	end 

	private
	def comment_params 
		params.require(:comment).permit(:cantent, :product_id, :customer_id, :stars)
	end
end