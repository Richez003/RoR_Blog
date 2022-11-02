class LikesController < ApplicationController

  before_action :require_signin

  def create
@movie = Movie.find(params[:movie_id])
@movie.likes.create!(user: current_user )
redirect_to @movie
  end

def destroy
  like = current_user.likes.find(params[:id])
  like.destroy

  movie = Movie.find(params[:movie_id])
  redirect_to movie
end
end
