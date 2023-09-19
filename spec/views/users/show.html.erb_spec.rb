require 'rails_helper'

RSpec.feature 'User Show Page' do
  scenario 'Viewing user details' do
    # Create a test user directly in the test database
    user = User.create(name: 'Test User', bio: 'Test Bio')

    visit user_path(user)

    # Add expectations for the user show page as mentioned in the requirements
    expect(page).to have_content(user.name)
    # Add expectations for user profile picture, post count, bio, and click link as before
    click_link 'See all posts'
    # Add expectations for user's posts index page as before
  end
end
