class Post < ApplicationRecord
  belongs_to :user
  has_many :reacts, dependent: :destroy
  has_many :reacters, through: :reacts, source: :user
  has_many :comments, dependent: :destroy

  validates :content, presence: true, if: :is_not_draft?
  validates :title, presence: true
  enum status: [:draft, :pending, :published, :declined]

  def is_not_draft?
    status != "draft"
  end
end
