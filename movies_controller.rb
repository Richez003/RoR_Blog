class MoviesController < ApplicationController
  before_action :require_signin, except: [:index, :show]

  before_action :require_admin, only: [:index, :show, :edit, :update, :destroy]

  def index
      @movies = Movie.upcoming
    end

    def show
      @movie = Movie.find(params[:id])
      @likers = @movie.likers
      @categories = @movie.categories
      if current_user
      @like = current_user.likes.find_by(movie_id: @movie.id)
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
 if @movie.update(movie_params)
    redirect_to @movie, notice: "movie successfully updated!"
  else
   render :edit
  end
end

  def new
    @movie = Movie.new
  end

 def create
    @movie = Movie.new(movie_params)
  if @movie.save
 redirect_to @movie, notice: "movie successfully created!"

 else
    render :new
 end
end

 def destroy
@movie = Movie.find(params[:id])
@movie.destroy
redirect_to movies_url
 end

private

def movie_params
  params.require(:movie).permit(:name, :description, :price, :starts_at, :image_file_name, :capacity, category_ids: [])
end
  end

