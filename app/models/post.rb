class Post < ApplicationRecord

  belongs_to :user
  belongs_to :genre

  has_many :favorites,  dependent: :destroy
  has_many :comments,   dependent: :destroy
  has_many_attached :post_images

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.search(search)
     where(['name LIKE ?', "%#{search}%"])
  end


end
