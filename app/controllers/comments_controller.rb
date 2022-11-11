class CommentsController < ApplicationController
  load_and_authorize_resource
  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = params[:user_id]
    @comment.post_id = params[:post_id]
  

    if @comment.save
      redirect_to user_post_path(@comment.author_id, @comment.post_id)
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to user_posts_path(current_user), notice: 'Comment deleted!' }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
