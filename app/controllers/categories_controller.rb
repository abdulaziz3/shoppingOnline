class CategoriesController < ApplicationController
  before_action :requore_admin, except: [:show, :index]
  
  def index
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end

  def show
  end
 
  def new
    @category = Category.new
  end

  def edit
	  
  end

  def create
	  @category = Category.new(category_params)
	  if @category.save
		  flash[:success] = "Category was created successfully"
		  redirect_to categories_path
      else
		  render'new'
      end
  end

  def update
	@category = Category.find(params[:id])
	if @category.update(category_params)
	flash[:success] = "Category name was successfully updated"
	redirect_to category_path(@category)
		   
      else
	render'edit'
      end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
    def requore_admin
		id !signed_in? || (signed_in? and !current_user.admin?)
		redirect_to root_path
	end
end
