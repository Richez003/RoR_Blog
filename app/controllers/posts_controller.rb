class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.find(params[:user_id])
    # @posts.includes([:comments])
  end

  def show
    @user = User.find(params[:user_id])
    @posts = @user.posts.find(params[:user_id])
  end
end
