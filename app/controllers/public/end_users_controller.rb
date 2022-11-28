class Public::EndUsersController < ApplicationController
  def show
    @reviews = current_end_user.reviews.where(status: :published)
  end

  def withdrawal
    @end_user = current_end_user
    @end_user.update(is_acive: false)
    # すべてのセッションを消す
    reset_session
    redirect_to root_path

  end

  def draft
    @reviews = current_end_user.reviews.where(status: :draft)
  end


end
