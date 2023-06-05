class Admin::UsersController < ApplicationController
  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).order(created_at: :desc)
    @comments = @user.comments.page(params[:page]).order(created_at: :desc)
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(users_params)
    flash[:notice] = "更新しました。"
    redirect_to admin_users_path
  end

end

  private

  def users_params
    params.require(:user).permit(:is_deleted)
  end

