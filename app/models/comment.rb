class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def comment_update
    posts.update(comments_counter: post.comment.count )
  end
end
