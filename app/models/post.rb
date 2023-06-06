class Post < ApplicationRecord

  belongs_to :user
  belongs_to :genre

  has_many :favorites,  dependent: :destroy
  has_many :comments,   dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  has_many_attached :post_images

  def get_post_images(width, height)
    unless post_images.attached?
       file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
        post_images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    post_images.variant(resize_to_limit: [width, height]).processed
  end

end
