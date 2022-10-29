class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    # @posts = Post.includes(:user, :comments, :likes).where(user_id: params[:user_id]).order(created_at: :desc)

    # @posts.includes([:comments])
  end

  def show
    @user = User.find(params[:user_id])
    @posts = @user.posts.find(params[:user_id])
  end

  def new
    @post = Post.new
  end
  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    @post.likes_counter = 0
    @post.comments_counter = 0
    if @post.save
      redirect_to user_posts_path(@user.id)
    else
      render :new
    end
  end
private

def post_params
  params.require(:post).permit(:text, :title, :user_id)
end
end
