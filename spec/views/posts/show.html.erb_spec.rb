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
    it 'shows first post Like button' do
      expect(page).to have_content('Like')
    end
    it 'shows the comment on the page' do
      expect(page).to have_content('Comment')
    end
    it 'shows the comments counter' do
      expect(page).to have_content('Comments counter: 2')
    end
    it 'shows the likes counter' do
      expect(page).to have_content('Likes_counter: 0')
    end
    it 'shows the comment content' do
      expect(page).to have_content('Tom: Hi Elvis!')
    end
  end
end
