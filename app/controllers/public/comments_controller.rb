class Public::CommentsController < ApplicationController
  def new
  end

  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comments_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)

  end

  def index
    @user = current_user
    @comments = @user.comments.all
  end

  def show
  end

  def edit
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to comments_path(current_user)
  end


  private

  def comments_params
    params.require(:comment).permit(:comment)
  end

end
