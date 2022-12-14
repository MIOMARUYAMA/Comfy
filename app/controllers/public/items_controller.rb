class Public::ItemsController < ApplicationController
  before_action :get_results

  def show
    @item = Item.find(params[:id])
    @review = Review.new
    @reviews = @item.reviews.where(status: :published)
  end

  #検索結果を表示する
  def search
    @items = @search.result
  end

  def index
    @items = Item.all
  end

  private

    def get_results
      @search = Item.ransack(params[:q])
    end
    def review_params
      params.require(:review).permit(:item_id, :evaluation, :content, :end_user_id, :status)
    end

end
