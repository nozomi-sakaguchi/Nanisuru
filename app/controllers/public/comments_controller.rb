class Public::CommentsController < ApplicationController
  def new
    @comment= Comment.new

  end

  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comments_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)

  end

  def index
  end

  def show
  end

  def edit
  end



  private

  def comments_params
    params.require(:comment).permit(:comment)
  end

end
