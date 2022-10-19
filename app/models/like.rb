class Like < ApplicationRecord
  belongs_to :author
  belongs_to :post

  def update_post_like_count
    post.increment!(:likes_counter)
  end
end
