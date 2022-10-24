class PostsController < ApplicationController
  def index
  end
   @posts = Post.all
  def show
  end
end
