class Public::ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @item = Item.find(params[:item_id])
    @review = current_end_user.reviews.new(review_params)
    @review.item_id = @item.id
    if @review.save
      redirect_to item_path(@item.id)
      flash[:notice] = "レビューが投稿されました！"
    else
      redirect_to item_path(@item.id)
      flash[:notice] = "星評価は必須項目です"
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to end_user_path
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to item_path(@review.item.id)
  end


  private
    def item_params
      params.require(:item).permit(:name, :price, :introduction, :genre_id)
    end
    def review_params
      params.require(:review).permit(:content, :evaluation, :status, :item_id, :end_user_id)
    end

end
