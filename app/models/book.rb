class Book < ApplicationRecord
  has_one_attached :profile_image
  belongs_to :user

  validates :title, presence: true
  validates :body, length: { in: 1..200 }

  def get_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
