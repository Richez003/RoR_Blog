class Like < ApplicationRecord
  belongs_to :user,  foreign_key: 'user_id', class_name: 'Post'
  belongs_to :post

  def update_post_like_count
    post.increment!(:likes_counter)
  end
end
