class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.page(params[:page]).order(created_at: :desc)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] ="あそびを削除しました。"
    redirect_to admin_posts_path(post.id)
  end


end