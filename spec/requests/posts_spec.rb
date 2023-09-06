require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts' do
    let(:user) { User.create(name: 'Test User') }

    it 'returns a successful response' do
      get "/users/#{user.id}/posts"
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get "/users/#{user.id}/posts"
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get "/users/#{user.id}/posts"
      expect(response.body).to include('List of all posts')
    end
  end
end
