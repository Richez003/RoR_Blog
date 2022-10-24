class UsersController < ApplicationController
  def index; end
  @users = User.all
  def show; end
end
