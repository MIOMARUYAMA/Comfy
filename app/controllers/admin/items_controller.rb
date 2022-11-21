class Admin::ItemsController < ApplicationController
  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_homes_top_path
    else
      redirect_to new_admin_item_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :genre_id)
  end


end