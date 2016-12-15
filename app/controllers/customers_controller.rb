class CustomersController < ApplicationController
  before_action :set_customer, only: [:update, :edit, :show, :destroy]
  before_action :authorise, only: [:update, :edit, :show]
  before_action :require_admin, only: [:destroy, :index]
  
  def index
    	@customers = Customer.paginate(page: params[:page], per_page: 10)
  end

 
  def show
	  @customer = Customer.find(params[:id])
  end

  def new
    	@customer = Customer.new
  end

  def edit
  end

  def create
	@customer = Customer.new(customer_params)
	if @customer.save
		CustomerMailer.welcome(@customer).deliver_now
		session[:customer_id] = @customer.id
		flash[:success] = "Welcom to the future shopping #{@customer.f_name}"
		redirect_to customer_path(@customer)
      	else
		render'new'
    	end
end

  def update
	  if @customer.update(customer_params)
	 	flash[:success] = "User was successfully updated"
	 	 redirect_to customer_path(@customer)
      	 else
		 render'edit'
     	 end
 end
  
def destroy
	@customer = Customer.find(params[:id])
	@customer.destroy
	 flash[:danger] = "User was successfully deleted"
	 redirect_to customers_path
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white lis
  def customer_params
	params.require(:customer).permit(:l_name, :f_name, :email, :address, :city, :country, :password, :password_confirmation, :latitude, :longitude)
    end
  #def require_same_customer
#	  if current_customer != @customer and !@current_customer.admin?
#		  flash[:danger] = "You can only edit your own account"
#		  redirect_to root_path
#	  end 
#  end
  def require_admin
	  if !signed_in? || (signed_in? and !@current_customer.admin?)
		  flash[:danger] = "Only admins can perform that action"
		  redirect_to products_path
	  end
  end
end