class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.all
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path(post.id)
  end

 
end