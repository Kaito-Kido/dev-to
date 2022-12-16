class Post < ApplicationRecord
  belongs_to :user
  has_many :reacts, dependent: :destroy
  has_many :reacters, through: :reacts, source: :user
  has_many :comments, dependent: :destroy

  validates :title, :content, presence: true, if: :is_not_draft?
  enum status: [:draft, :pending, :published]

  def is_not_draft?
    status != "draft"
  end
end
