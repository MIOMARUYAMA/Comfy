class ApplicationController < ActionController::Base
    before_action :get_results

  def get_results
    @search = Item.ransack()
  end
  def guest_sign_in
    user = EndUser.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to end_user_path(current_end_user.id), notice: 'ゲストユーザーとしてログインしました。'
  end

end
