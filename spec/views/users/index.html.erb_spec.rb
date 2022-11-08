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

    describe 'index page' do
      before(:each) do
        visit users_path
      end

      it 'shows first username' do
        expect(page).to have_content('Tom')
      end      
      it 'shows second username' do
        expect(page).to have_content('Elvis')
      end

      it 'shows number of posts for first username' do
        expect(page).to have_content('Number of posts: 3')
      end

      it 'shows number of posts for second username' do
        expect(page).to have_content('Number of posts: 2')
      end

      it 'shows the profile picture of all users' do
        image = page.all('img')
        expect(image.size).to eq(2)
      end

      it 'redirects to the user page when clicking on the username' do
        click_link('Tom')
        expect(page).to have_content('Tom')
      end
    end
  end