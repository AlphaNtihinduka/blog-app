require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:each) do
    @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
    @like = Like.create(post: @post, author: @user)
  end

  context 'Test Likes methods' do
    it 'The likes counter has to be updated' do
      6.times do
        Like.create do |like|
          like.post = @post
          like.author = @user
        end
      end
      expect(@post.likes_counter).to eq 7
    end
  end
end