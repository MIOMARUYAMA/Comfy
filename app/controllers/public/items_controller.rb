class Public::ItemsController < ApplicationController
  before_action :get_results

  def show
    @item = Item.find(params[:id])
    @review = Review.new
  end

  #検索結果を表示する
  def search
    @items = @search.result
  end

  def index
  end

  private

    def get_results
      @search = Item.ransack(params[:q])
    end
end
