class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new
    @like.user_id = current_user.id
    @like.save
    redirect_to user_posts_path(:user_id, @post.id)
  end
end
