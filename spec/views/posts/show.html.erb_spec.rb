require 'rails_helper'

RSpec.feature 'Post Show Page' do
  scenario 'Viewing post details' do
    # Create a test user directly in the test database
    user = User.create(name: 'Test User', bio: 'Test Bio')

    # Create a post associated with the user
    post = user.posts.create(title: 'Test Post', text: 'Test Text')

    visit post_path(post)

    # Add expectations for the post show page as mentioned in the requirements
    expect(page).to have_content(post.title)
    expect(page).to have_content("Author: #{user.name}")
    # Add expectations for post details and comments as before
  end
end
