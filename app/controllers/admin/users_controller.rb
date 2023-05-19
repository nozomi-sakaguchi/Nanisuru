class Admin::UsersController < ApplicationController
  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.all(@user.id)
  end

  def edit
  end

  def post_index
  end
end
