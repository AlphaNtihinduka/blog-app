require 'rails_helper'

RSpec.describe 'User pages', type: :system do

  before(:all) do
    Rails.application.load_seed
  end

  after(:all) do
    Like.destroy_all
    Comment.destroy_all
    Post.destroy_all
    User.destroy_all
  end 

    describe 'show page' do
        let(:author) { User.first.id }
        subject(:post) { Post.first.id }
        before(:each) do
          visit user_post_path(author, post)
        end

      it 'shows first username' do
        expect(page).to have_content('Like')
      end     
      
        it 'shows number of posts for the username' do
        expect(page).to have_content('Number of posts: 3')
      end

      it 'shows number of comments and likes for the first post' do
        expect(page).to have_content('comments: 2 likes: 0')
      end

   

    
    end
  end