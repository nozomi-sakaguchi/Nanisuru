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
    @comment = Comment.new
    @comments = @post.comments.all
  end

  def edit
    @post = Post.find(params[:id])
    unless @post.id == current_user.id
      redirect_to post_path
    end
  end

  def update
    post = Post.find(params[:id])
    post.update(posts_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post =Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

 private

  def posts_params
    params.require(:post).permit(:user_id, :genre_id, :name ,:introduction, :time, :cost, :age)
  end

end