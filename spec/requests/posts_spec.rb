#require 'rails_helper'

#RSpec.describe 'Posts', type: :request do
#  describe 'GET /users/:user_id/posts' do
#    let(:user) { User.create(name: 'Test User') }

#    it 'returns a successful response' do
#      get user_posts_path(user)
#      expect(response).to have_http_status(200)
#    end

#    it 'renders the index template' do
#      get user_posts_path(user)
#      expect(response).to render_template(:index)
#    end

#    it 'includes correct placeholder text in the response body' do
#      get user_posts_path(user)
#      expect(response.body).to include('List of all posts')
#    end
#  end

#  describe 'GET /posts/:id' do
#    let(:user) { User.create(name: 'Test User') }
#    let(:post) { Post.create(title: 'Test Post', author: user) }

#    it 'returns a successful response' do
#      get post_path(post)
#      expect(response).to have_http_status(200)
#    end

#    it 'renders the show template' do
#      get post_path(post)
#      expect(response).to render_template(:show)
#    end

#    it 'includes the post title in the response body' do
#      get post_path(post)
#      expect(response.body).to include(post.title)
#    end
#  end
#end