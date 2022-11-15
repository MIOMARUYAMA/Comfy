class Public::ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.end_user_id = current_end_user.id
    @review.save
    redirect_to end_user_path(current_end_user.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def review_params
      params.require(:review).permit(:item_id, :content, :end_user_id, :evaluation)
    end

end
