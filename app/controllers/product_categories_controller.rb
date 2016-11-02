class ProductCategoriesController < ApplicationController
  before_action :set_product_category, only: [:show, :edit, :update, :destroy]

  def index
    @product_categories = ProductCategory.all
  end
  
  def show
	  @category_product = @category.product.paginate(page: params[:page], per_page: 10)
  end
  
  def new
    @product_category = ProductCategory.new
  end

  def edit
  end

  def create
    @product_category = ProductCategory.new(product_category_params)

    respond_to do |format|
      if @product_category.save
        format.html { redirect_to @product_category, notice: 'Product category was successfully created.' }
        format.json { render :show, status: :created, location: @product_category }
      else
        format.html { render :new }
        format.json { render json: @product_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product_category.update(product_category_params)
        format.html { redirect_to @product_category, notice: 'Product category was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_category }
      else
        format.html { render :edit }
        format.json { render json: @product_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product_category.destroy
    respond_to do |format|
      format.html { redirect_to product_categories_url, notice: 'Product category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_category
      @product_category = ProductCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_category_params
      params.require(:product_category).permit(:product_id, :catigory_id)
    end
end
