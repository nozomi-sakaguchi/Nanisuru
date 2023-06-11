class Public::PostsController < ApplicationController
  def new
    @post =Post.new
    if current_user.email == "guest@guest.mail"
      flash[:notice] ="ゲストログインは閲覧のみ可能です。"
      redirect_to posts_path
    end
  end

  def create
    post = Post.new(posts_params)
    post.user_id = current_user.id
    post.save!
    flash[:notice] ="投稿しました"
    redirect_to posts_path
  end

  def index
    if params[:search].present?
      @posts = Post.search(params[:search]).page(params[:page]).order(created_at: :desc)
    else
      @posts = Post.page(params[:page]).order(created_at: :desc)
    end
    @post = @posts.count
    @genres = Genre.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = Comment.new
    @comments = @post.comments.page(params[:page]).order(created_at: :desc)

  end

  def edit
    @post = Post.find(params[:id])
    unless @post.user_id == current_user.id
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
    flash[:notice] ="あそびを削除しました。"
    redirect_to  user_path(current_user)
  end

 private

  def posts_params
    params.require(:post).permit(:user_id, :genre_id, :name ,:introduction,:cost, post_images: [])
  end

end