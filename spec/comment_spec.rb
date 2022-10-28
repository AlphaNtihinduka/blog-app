require 'rails_helper'

RSpec.describe Comment, type: :model do
    before(:each) do
      @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
      @comment = Comment.create(post: @post, author: @user, text: 'Hi Tom!')
    end
  
    it 'Comment should be valid with valid attributes' do
        expect(@comment).to be_valid
      end

      it 'The comment author return user' do
        expect(@comment.author).to eq(@user)
      end
    
      it 'Should not be valid without an author' do
        @comment.author = nil
        expect(@comment).to_not be_valid
      end
    
      it 'Should not be valid without a post' do
        @comment.post = nil
        expect(@comment).to_not be_valid
      end
    
      it 'is not valid without a text' do
        @comment.text = nil
        expect(@comment).to_not be_valid
      end
  end