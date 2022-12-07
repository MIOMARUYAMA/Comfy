class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :reviews, dependent: :destroy

  def get_image(width, height)
    # unless image.attached?
    #   file_path = Rails.root.join('app/assets/images/icon_002680_256.png')
    #   image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/pmg')
    # end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
