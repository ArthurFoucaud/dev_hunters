class ReviewsController < ApplicationController
  before_action :set_dev, only: %i[new create]

  def new
    authorize @review
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.dev = @dev
    authorize @review
    @review.save
    redirect_to dev_path(@dev)
  end

  def destroy
    @review = Review.find(params[:id])
    authorize@review
    @review.destroy
    @dev = Dev.find(params[:dev_id])
    redirect_to devs_path(@dev), status: :see_other
  end

  private

  def set_dev
    @dev = Dev.find(params[:dev_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
