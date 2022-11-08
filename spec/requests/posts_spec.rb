require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:each) { 
      User.create(
        name: 'Alpha Ijeoma',
        photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
        bio: 'This user has been a collaborative creation for posts',
        posts_counter: 0
      )

    get users_path(1)
  
  }
    it 'returns a 200 OK status' do
      expect(response).to have_http_status(:ok)
    end

    it 'Is correct template rendered' do
      expect(response).to render_template('index')
    end

    it 'Is the body includes correct text' do
      expect(response.body).to include('Alpha Ijeoma')
    end
  end
end
