class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

validate :title, presence: true, length: { minimum: 250 }
validate :comments_counter, numericallity: { only_integer: true,  greater_than_or_equal_to: 0 }
validate :likes_counter, numericallity: { only_integer: true,  greater_than_or_equal_to: 0 }


  def update_post_counter
    user.update(posts_counter: user.posts.count)
  end

  def five_recent_post
    comments.order(created_at: :desc).limit(5)
  end
end
