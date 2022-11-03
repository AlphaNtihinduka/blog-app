require "rails_helper"

RSpec.describe 'Posts', type: :request do
  describe "GET #index" do
    before(:example) { get '/users/:id/posts'}
    it "returns a 200 OK status" do
      expect(response).to have_http_status(:ok)
    end

    it 'Is correct template rendered' do
      expect(response).to render_template('index')
    end

    it 'Is the body includes correct text' do
      expect(response.body).to include('Posts for selected user')
    end
  end
end