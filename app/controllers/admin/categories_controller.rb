class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with :name => "Jungle", :password => "book"

  def index
    @category = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def destroy
    if (Category.find params[:id])
      Category.delete params[:id]
    end
    redirect_to [:admin, :categories], notice: 'Category deleted!'
  end


  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
