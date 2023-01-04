class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :reacts, as: :reactable, dependent: :destroy

  validates :content, presence: true
end
