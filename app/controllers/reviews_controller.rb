class ReviewsController < ApplicationController

  before_action :require_login

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)

    if @review.save
      flash.notice = "Successfully added Comment!"
      redirect_to "/products/#{@product.id}"
    else
      flash.now.alert = "There was an error"
      render 'products/show'
    end
  end

  def destroy
    Review.delete params[:id]
    redirect_to "/products/#{params[:product_id]}", notice: 'Category deleted!'
  end

  private

  def review_params
    params.require(:review).permit(
      :product_id,
      :user_id,
      :description,
      :rating
      )
  end

  def require_login
    unless current_user
      flash[:error]
      redirect_to '/login'
    end
  end
end
