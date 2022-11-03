require "rails_helper"

RSpec.describe UsersController, :type => :controller do

  describe "GET #index" do
    before(:example) { get :index}
    it "returns a 200 OK status" do
      expect(response).to have_http_status(:ok)
    end

    it 'Is correct template rendered' do
      expect(response).to render_template('index')
    end
  end

end