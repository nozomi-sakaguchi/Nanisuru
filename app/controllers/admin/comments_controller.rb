class Admin::CommentsController < ApplicationController
  def index
  end

  def destroy
    comment= Comment.find(params[:id])
    comment.destroy
    flash[:notice] = "コメントを削除しました。"
    redirect_to admin_post_path(comment.id)
  end



end
