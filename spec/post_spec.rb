require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
  end
  
  it 'Post should have valid attributes' do
    expect(@post).to be_valid
  end

  it 'The recent five comments for each post should be returned' do
    7.times do
      Comment.create do |comment|
        comment.post = @post
        comment.author = @user
        comment.text = "Hi Tom!"
      end
    end
    @comment = @post.recent_five_comments
    expect(@comment.size).to eq 5
  end

  it 'The author should be present' do
    @post.author = nil
    expect(@post).to_not be_valid
  end

  it 'The title should be present' do
    @post.title = nil
    expect(@post).to_not be_valid
  end

  it 'The title should not exceed 250 characters' do
    @post.title = 'Title' * 100
    expect(@post).to_not be_valid
  end

  it 'The comments counter should be equal to zero' do
    @post.comments_counter = 0
    expect(@post).to be_valid
  end

  it 'comments_counter should be an integer' do
    @post.comments_counter = 'a'
    expect(@post).to_not be_valid
  end

  it 'The likes counter should be equal zero' do
    @post.likes_counter = 0
    expect(@post).to be_valid
  end

  it 'likes_counter should be an integer' do
    @post.comments_counter = 'abc'
    expect(@post).to_not be_valid
  end
end
