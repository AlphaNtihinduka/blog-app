require "rails_helper"

RSpec.describe 'Users', type: :request do
  describe "GET #index" do
    before(:example) { get '/users'}
    it "returns a 200 OK status" do
      expect(response).to have_http_status(:ok)
    end

    it 'Is correct template rendered' do
      expect(response).to render_template('index')
    end

    it 'Is the body includes correct text' do
      expect(response.body).to include('This is a list of all users')
    end
  end

  describe "GET #show" do
  before(:example) { get '/users/:id'}
  it "returns a 200 OK status" do
    expect(response).to have_http_status(:ok)
  end

  it 'Is correct template rendered' do
    expect(response).to render_template('show')
  end

  it 'Is the body includes correct text' do
    expect(response.body).to include('Listing all the Posts')
  end
end

end