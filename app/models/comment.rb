class Comment < ApplicationRecord
  has_many :comments, as: :commentable 

  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :content, presence: true
end
