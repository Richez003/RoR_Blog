class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  validates :name, presence: true
  validate :posts_counter, numericallity: { only_integer: true,  greater_than_or_equal_to: 0 }

  private

  def three_recent_post
    posts.order(created_at: :desc).limit(3)
  end
end
