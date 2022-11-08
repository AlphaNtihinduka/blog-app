class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user.id).includes(:comments)
  end

  def show
    @user = User.includes(:posts).find(params[:user_id])
    @post = Post.includes(:comments).find(params[:user_id])
    @comments = Comment.where(post_id: @post.id).includes(:author)
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

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
