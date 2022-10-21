class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  validates :name, presence: true
  # validates :posts_counter, numerically: { only_integer: true,  greater_than_or_equal_to: 0 }
  validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  private

  def three_recent_post
    posts.order(created_at: :desc).limit(3)
  end
end
