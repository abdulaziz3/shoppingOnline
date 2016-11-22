class CommentsController < ApplicationController
	before_action :authorise, only: [:new, :create]
	#before_action :requre_same_customer, only: [:edit, :update, :destroy]
	#before_action :require_admin, except: [:index, :show, :destroy, :edit, :update] 
	
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
	#def require_same_user
	#	if current_customer != @customer and !@current_customer.admin?
	#	 flash[:danger] = "You can only edit your own comment"
	#	redirect_to root_path
	#	 end
	#end
  
	#def require_admin
	#	if signed_in? and !@current_customer.admin?
	#	flash[:danger] = "Only admin can perform that action"
	#	redirect_to root_path
	#	end
	#end
end