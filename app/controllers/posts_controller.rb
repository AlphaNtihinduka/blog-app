class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user.id).includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes([:author])
    @user = @post.author
  rescue ActiveRecord::RecordNotFound
    render file: 'public/404.html', status: :not_found
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Deleted!' }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
