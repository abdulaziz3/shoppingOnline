class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  #before_action :authorise, only: [:new, :create, :edit, :update, :destroy]
  
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new 
  def new
    @product = Product.new
  end

  # GET /products/1/edit
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
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:product_name, :product_pic, :description, :colour, :size, :price, :product_number)
    end
end