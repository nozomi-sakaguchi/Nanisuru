class Public::PostsController < ApplicationController
  def new
    @post =Post.new
  end

  def create
    post = Post.new(posts_params)
    post.user_id = current_user.id
    post.save!
    redirect_to posts_path
  end

  def index
    @posts = Post.all
    @post = @posts.count
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.all
    @comment = Comment.new
    @comments = Comment.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update
    redirect_to post_path(post.id)
  end

 private

  def posts_params
    params.require(:post).permit(:user_id, :genre_id, :name ,:introduction, :time, :cost, :age)
  end

end