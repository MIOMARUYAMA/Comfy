class Public::EndUsersController < ApplicationController
  def show
    @reviews = current_end_user.reviews.where(status: :published)
  end

  def withdrawal
  end

  def draft
    @reviews = current_end_user.reviews.where(status: :draft)
  end


end
