class Admin::ReviewController < ApplicationController
  def index
    @reviews = Review.page(params[:page])
  end
end
