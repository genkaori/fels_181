class CategoriesController < ApplicationController
  before_action :logged_in?, only: [:create, :destroy]
  
  def index
    @categories = Category.all
    @category = Category.new
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    if @category = @category.update_attributes(category_params)
      flash[:success] = t "update_success"
    end
    redirect_to categories_path
  end  

  def create
    @category = Category.create(category_params)
    if @category.save
      flash[:success] = t "add_success"
    end
    redirect_to :back
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to :back
  end

  def show
    @categories = Category.all
    @category = Category.new
  end
  
  private
  def category_params
    params.require(:category).permit(:name)
  end
end
