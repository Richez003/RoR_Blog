class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def update_post_counter
    user.update(posts_counter: user.posts.count)
end

def five_recent_post
  comments.order(created_at: :desc).limit(5)
end
end
