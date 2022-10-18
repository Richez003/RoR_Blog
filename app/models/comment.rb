class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def post_comment_update
    post.update(comments_counter: post.comments.count)
  end
end
