class User < ApplicationRecord

  enum role: {admin: 0, user: 1}

  
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :posts, dependent: :destroy
    has_many :reacts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :received_follows, foreign_key: :followed_id, class_name: "Follow", dependent: :destroy
    has_many :followers, through: :received_follows, source: :follower
    has_many :given_follows, foreign_key: :follower_id, class_name: "Follow", dependent: :destroy
    has_many :followings, through: :given_follows, source: :followed_user
    has_many :send_notifications, foreign_key: :sender_id, class_name: Notification.name, dependent: :destroy
    has_many :notifications, foreign_key: :receiver_id, class_name: Notification.name, dependent: :destroy

  validates :role, presence: true
  validates :name, presence: true, on: :update
  validates :email, uniqueness: true
end

