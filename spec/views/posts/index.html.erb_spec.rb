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
      before(:each) do
        visit user_posts_path(User.first)
      end

      it 'shows first username' do
        expect(page).to have_content('Tom')
      end      

      it 'shows number of posts for the username' do
        expect(page).to have_content('Number of posts: 3')
      end

      it 'shows the comments for the best' do
        expect(page).to have_content('third post by second user and i am Elvis')
      end

      it 'shows the comments for the best' do
        expect(page).to have_content('Tom: Hi Elvis!')
      end

      it 'shows the profile picture of the user' do
        image = page.all('img')
        expect(image.size).to eq(1)
      end
    end
  end