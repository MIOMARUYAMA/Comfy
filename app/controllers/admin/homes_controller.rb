class Admin::HomesController < ApplicationController
  def top
    @items=Item.page(params[:page]).per(8)
  end

  private

    def item_params
      params.require(:item).permit(:name, :introduction, :price, :image, :is_active, :genre_id)
    end

end
