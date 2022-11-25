class ReviewsController < ApplicationController
  before_action :set_dev, only: %i[new create]
  before_action :set_review, only: %i[new create]


  def new
    @review = Review.new(dev_id: @dev)
    authorize @review
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
    @review = Review.new(dev_id: @dev)
  end

  def set_review
    @dev = Dev.find(params[:dev_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
