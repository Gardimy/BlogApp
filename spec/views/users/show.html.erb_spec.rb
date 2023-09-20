require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  before do
    # Add setup code here if needed (e.g., create a user record)
  end

  it 'displays user profile information and first 3 posts' do
    user = User.create(name: 'Username1', bio: 'User Bio')
    user.posts.create(title: 'First Post Title', text: 'First Post Text')
    user.posts.create(title: 'Second Post Title', text: 'Second Post Text')
    user.posts.create(title: 'Third Post Title', text: 'Third Post Text')

    visit user_path(user)

    # Add Capybara assertions to check for user profile information and posts
    expect(page).to have_content('Username1')
    expect(page).to have_selector('img.user-image')
    expect(page).to have_content('Number of Posts: 3')
    expect(page).to have_content('User Bio')
    expect(page).to have_content('First Post Title')
    expect(page).to have_content('Second Post Title')
    expect(page).to have_content('Third Post Title')
  end

  it 'redirects to a user\'s post index page when clicking "See all posts"' do
    user = User.create(name: 'Username1', bio: 'User Bio')
    visit user_path(user)

    # Click the "See all posts" link
    click_link('See all posts')

    expect(current_path).to eq(user_posts_path(user))
    expect(page).to have_content('All Posts by Username1')
  end
end
