class ReviewsController < ApplicationController
  before_action :set_review, only: [:show]
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    if @review.save
      redirect_to restaurant_path(params[:restaurant_id])
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def set_review
    @review = Review_.find(params[:id])
  end

end
