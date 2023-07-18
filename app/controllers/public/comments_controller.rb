class Public::CommentsController < ApplicationController
  def new
  end

  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comments_params)
    if current_user.email == "guest@guest.mail"
      flash[:notice] ="ゲストログインは閲覧のみ可能です。"
      redirect_to posts_path
    else
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)
    end

    if comment.post_id = post.id
      comment.save
      redirect_to post_path(post)
    else
      flash[:notice] ="空欄で投稿できません。"
      redirect_to posts_path
    end
  end

  def index
    @user = current_user
    @comments = @user.comments.all.order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  def destroy
    Comment.find(params[:id]).destroy
     flash[:notice] ="コメントを削除しました。"
    redirect_to comments_path(current_user)
  end


  private

  def comments_params
    params.require(:comment).permit(:comment)
  end

end
