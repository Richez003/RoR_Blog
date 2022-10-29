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
    @post = Post.new(posts_params)
    if @post.save
      redirect_to user_post_path(id: @post.id, user_id: @post.user_id), notice: 'Post created succesfully!'
    else
      render :new, alert: 'Post could not be created an Error occurred!'
    end
  end

  private

  def posts_params
    params.require(:post).permit(:text, :title, :user_id)
  end
end
