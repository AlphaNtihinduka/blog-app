class PostsController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        @posts = Post.where(author_id: @user.id)
    end

    def show
        @post = Post.find(params[:user_id])
        @comments = Comment.where(post_id: @post.id)
    end
end