class Review < ApplicationRecord
  belongs_to :end_user
  belongs_to :item
  has_one_attached :image

  def get_image
    if image.attached?
      image
      image.variant(resize_to_limit: [width, height]).processed
    end
  end

  validates :content, presence: true
  validates :evaluation, presence: true

end
