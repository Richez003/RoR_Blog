class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true
  # validates :posts_counter, numerically: { only_integer: true,  greater_than_or_equal_to: 0 }
  validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  private

  def three_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end

# def five_recent_comments
#   comments.order(created_at: :desc).limit(5)
# end
