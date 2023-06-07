class Public::UsersController < ApplicationController

  def guest_log_in
    user = User.guest
    sign_in user
    redirect_to posts_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def index
    @user = User.find(params[:id])
    @post= @user.posts
    @posts= Post.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).order(created_at: :desc)
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
   @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(users_params)
    flash[:notice] = "更新しました。"
    redirect_to user_path(current_user)
  end

  def secession
  end

  def  withdrawal
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "ご利用ありがとうございました。"
    redirect_to root_path
  end

  private

  def users_params
     params.require(:user).permit(:username, :age, :gender, :introduction, :is_deleted, :post_images )
  end

  def posts_params
    params.require(:post).permit(:user_id, :genre_id, :name ,:introduction, :time, :cost, :age)
  end
end