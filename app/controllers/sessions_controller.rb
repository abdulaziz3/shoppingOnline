class SessionsController < ApplicationController

  def new

  end

  def create
	  customer = Customer.find_by(email: params[:session][:email].downcase)
	  if customer && customer.authenticate(params[:session][:password])
		  session[:customer_id] = customer.id
		  current_cart.save
		  flash[:success] = "Welcome back"
		  redirect_to session[:return_to] || root_path
	  else
		  flash[:danger] = "Invalid email / password "
		  render'new'
	  end
  end

  def destroy
	  if signed_in?
		  session[:customer_id] = nil
	  else
		  flash[:notice] = "You need to sign in"
	  end
	  redirect_to root_path
  end
end