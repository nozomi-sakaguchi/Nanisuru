class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  def self.guest
      #binding.pry
      find_or_create_by!(username: 'ゲスト',email: 'guest@guest.mail') do |user|
      user.username = 'ゲスト'
      user.password = SecureRandom.urlsafe_base64
    end
  end

  has_many :posts
  has_many :favorites,   dependent: :destroy
  has_many :comments ,   dependent: :destroy

  has_many_attached :post_images


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
