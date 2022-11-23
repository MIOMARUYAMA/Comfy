class Review < ApplicationRecord
  belongs_to :end_user
  belongs_to :item
  has_one_attached :image
  has_many :favorites, dependent: :destroy

  def favorited_by?(end_user)
    favorites.exists?(end_user_id: end_user.id)
  end

  def get_image
    if image.attached?
      image
      image.variant(resize_to_limit: [width, height]).processed
    end
  end

  validates :content, presence: true
  validates :evaluation, presence: true

  enum status: {draft: 1,published: 0}
end
