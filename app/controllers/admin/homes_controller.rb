class Admin::HomesController < ApplicationController
  def top
    @items = Item.all
  end

  private

    def item_params
      params.require(:item).permit(:name, :introduction, :price, :image, :is_active, :genre_id)
    end

end
