class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def show
    @review = Review.find_by(id: params["id"])
  end

  def create
    @review = Review.new(review_params)
      @review.save
    redirect_to @review
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating, :game_id, :user_id, :appointment_id)
  end
end
