class Public::FavoritesController < ApplicationController
  def index
  @favorites= current_user.favorites.includes(:post).order("created_at DESC")

  end

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: post.id)
     if current_user.email == "guest@guest.mail"
      flash[:notice] ="ゲストログインは閲覧のみ可能です。"
      redirect_to post_path(post.id)
    else
    favorite.save
    redirect_to post_path(post)
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to post_path(post)
  end
end
