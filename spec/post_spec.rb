require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:author) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  subject(:post) { Post.create(author:, title: 'Hello', text: 'This is my first post') }

  it 'Post should have valid attributes' do
    expect(post).to be_valid
  end

  it 'The author should be present' do
    post.author = nil
    expect(post).to_not be_valid
  end

  it 'The title should be present' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'The title should not exceed 250 characters' do
    post.title = 'Title' * 100
    expect(post).to_not be_valid
  end

  it 'The comments counter should be equal to zero' do
    post.comments_counter = 0
    expect(post).to be_valid
  end

  it 'comments_counter should be an integer' do
    post.comments_counter = 'a'
    expect(post).to_not be_valid
  end

  it 'The likes counter should be equal zero' do
    post.likes_counter = 0
    expect(post).to be_valid
  end

  it 'likes_counter should be an integer' do
    post.comments_counter = 'abc'
    expect(post).to_not be_valid
  end
end
