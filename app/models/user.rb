class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  def self.guest
    find_or_create_by!(email: 'guest@guest.mail') do |user|
      user.name = 'ゲストユーザー'
      user.password = SecureRandom.urlsafe_base64
    end
  end

  has_many :posts
  has_many :favorites
  has_many :comments ,   dependent: :destroy






  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
