module PostsHelper
  def three_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
  def three_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
def three_recent_posts
  posts.order(created_at: :desc).limit(3)
end
