class Public::UsersController < ApplicationController

  def guest_log_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to posts_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def index
    @user = User.find(params[:user_id])


  end

  def show
    @user = User.find(params[:id])
    @posts = current_user.posts.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(users_params)
    redirect_to user_path(current_user)
  end

  def secession
  end

  def  withdrawal
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def users_params
     params.require(:user).permit(:username, :age, :gender, :introduction, :is_deleted )
  end

  def posts_params
    params.require(:post).permit(:user_id, :genre_id, :name ,:introduction, :time, :cost, :age)
  end
end