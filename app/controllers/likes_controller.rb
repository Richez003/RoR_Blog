class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(user: current_user)
    redirect_to "/user/#{current_user.id}/post/#{@post.id}"
  end
end
