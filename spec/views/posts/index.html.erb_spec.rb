require 'rails_helper'

RSpec.feature 'User Post Index Page' do
  scenario 'Viewing user posts' do
    # Create a test user directly in the test database
    user = User.create(name: 'Test User', bio: 'Test Bio')
    
    # Create posts associated with the user
    post1 = user.posts.create(title: 'Post 1', text: 'Text 1')
    post2 = user.posts.create(title: 'Post 2', text: 'Text 2')
    post3 = user.posts.create(title: 'Post 3', text: 'Text 3')

    visit user_posts_path(user)

    expect(page).to have_content(user.name)
    # Add expectations for user profile picture, post count, and post details as before
    [post1, post2, post3].each do |post|
      expect(page).to have_content(post.title)
      # Add expectations for post details and click link as before
    end
  end
end
