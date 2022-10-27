class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  def three_recent_post
    posts.order(created_at: :desc).limit(3)
  end
end
