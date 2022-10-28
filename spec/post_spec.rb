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

 
end