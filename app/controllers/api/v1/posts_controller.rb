class Api::V1::PostsController < Api::V1::ApplicationController
  def index
    user = User.find(params[:user_id])
    posts = Post.where(author_id: user.id).includes(:comments)
    render json: posts, status: :ok
  end

  def show
    user = User.find(params[:id])
    posts = user.recent_three_posts
    render json: posts, status: :ok
  end
end
