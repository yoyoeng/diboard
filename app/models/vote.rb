class Vote < ApplicationRecord
  belongs_to :tag
  belongs_to :user
  has_many :liked_tags, through: :votes, source: :post
  validates_uniqueness_of :tag_id, scope: :user_id

  def already_voted?(tag)
    self.votes.exists?(tag_id: tag.id)
  end
end
