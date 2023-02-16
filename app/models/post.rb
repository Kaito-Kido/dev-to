class Post < ApplicationRecord
  enum status: { draft: 0, pending: 1, published: 2, declined: 3 }

  belongs_to :user

  has_many :reacts, as: :reactable, dependent: :destroy
  has_many :reacters, through: :reacts, source: :user
  has_many :tags, dependent: :destroy
  has_many :categories, through: :tags
  has_one_attached :cover
  has_rich_text :content
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :content, presence: true, if: :not_draft?
  validates :title, presence: true

  def not_draft?
    status != 'draft'
  end
end
