class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
 # before_action :authorise, except: [:show, :index]
  #before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @products = Product.paginate(page: params[:page], per_page: 10)
  end
  
  def show
  end


  def new
    @product = Product.new
  end

  def edit
  end

  
  def create
    	@product = Product.new (product_params)
     		if  @product.save
     			flash[:success] = "Product was successfully created"
     			redirect_to  product_path(@product)
     		else
     			 render 'new'
     		 end
     	 end
 


  def update 
     	 if @product.update(product_params)
        		flash[:success] = "Product was successfully updated"
        		redirect_to product_path(@product) 
    	 else
      	 	  render 'edit'
      	 end
  end

  def destroy
	  @product.destroy
	  flash[:danger] =  "Product was successfully deleted" 
	  redirect_to products_path
    end


  private

    def set_product
      	@product = Product.find(params[:id])
    end

 def product_params
	 params.require(:product).permit(:product_name, :product_pic, :description, :colour, :size, :price, :product_number)
    end
end
	