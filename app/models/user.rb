class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  private

  def three_recent_post
    posts.order(created_at: :desc).limit(3)
  end
end
