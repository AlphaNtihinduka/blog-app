require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  end

  context 'Test the user validations' do
    it 'name should be present' do
      @user.name = nil

      expect(@user).to_not be_valid
    end

    it 'The recent three posts for the user should be returned' do
      6.times do
        Post.create do |post|
          post.author = @user
          post.title = "This is post title"
          post.text = "This is post text"
        end
      end
      post = @user.recent_three_posts
      expect(post.length).to eq 3
    end

    it 'posts_counter should return an integer greater than or equal to 0' do
      @user.posts_counter = 0
      expect(@user).to be_valid
    end

    it 'posts_counter must be an integer' do
      @user.posts_counter = 'abc'
      expect(@user).to_not be_valid
    end

    it 'photo should be present' do
      @user.photo = nil

      expect(@user).to_not be_valid
    end

    it 'bio should be present' do
      @user.bio = nil

      expect(@user).to_not be_valid
    end

    it 'if bio is longer than 150' do
      @user.bio = 'bio' * 100

      expect(@user).to_not be_valid
    end
  end
end
