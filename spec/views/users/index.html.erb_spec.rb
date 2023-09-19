require 'rails_helper'

RSpec.feature 'User Index Page' do
  scenario 'Viewing user list' do
    # Create test users directly in the test database
    user1 = User.create(name: 'User One', bio: 'Bio One')
    user2 = User.create(name: 'User Two', bio: 'Bio Two')
    user3 = User.create(name: 'User Three', bio: 'Bio Three')

    visit users_path

    [user1, user2, user3].each do |user|
      expect(page).to have_content(user.name)
      # Add expectations for user profile picture, post count, and click link as before
      click_link user.name
      # Add expectations for user show page as before
      click_link 'See all posts'
      # Add expectations for user's posts index page as before
    end
  end
end
