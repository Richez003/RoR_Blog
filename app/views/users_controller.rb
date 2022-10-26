class UsersController < ApplicationController
  before_action :require_signin, only: %i[index show edit update destroy]

  before_action :require_correct_user, only: %i[edit update destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @registrations = @user.registrations
    @liked_movies = @user.liked_movies
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: 'thanks for signing up!'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'Account Successfully Updated'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to movies_url, notice: 'Account Successfully Deleted!'
  end

  private

  def require_correct_user
    @user = User.find(params[:id])
    redirect_to movies_url unless current_user?(@user)
    # unless current_user == @user
  end
end

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end
