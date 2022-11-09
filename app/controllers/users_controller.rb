class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    # fail
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post = @user.posts.find(params[:id])
    @likes = @user.likes.find(params[:id])
  end

  def three_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end

def three_recent_posts
  posts.order(created_at: :desc).limit(3)
end
