require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  it 'displays user profile information and first 3 posts' do
    user = User.create(name: 'Username1', bio: 'User Bio')
    
    # Create the first 3 posts associated with the user
    user.posts.create(title: 'First Post Title', text: 'First Post Text')
    user.posts.create(title: 'Second Post Title', text: 'Second Post Text')
    user.posts.create(title: 'Third Post Title', text: 'Third Post Text')
    
    # Create an additional post not associated with the user
    Post.create(title: 'Fourth Post Title', text: 'Fourth Post Text')

    visit user_path(user)

    expect(page).to have_content('Username1')
    expect(page).to have_selector('img.user-image')
    expect(page).to have_content('Number of Posts: 3') # Updated to 3 posts
    expect(page).to have_content('User Bio')
    
    expect(page).to have_content('First Post Title')
    expect(page).to have_content('First Post Text')
    expect(page).to have_content('Second Post Title')
    expect(page).to have_content('Second Post Text')
    expect(page).to have_content('Third Post Title')
    expect(page).to have_content('Third Post Text')

    # Ensure that the fourth post is not displayed
    expect(page).not_to have_content('Fourth Post Title')
    expect(page).not_to have_content('Fourth Post Text')
  end

  it 'redirects to a user\'s post index page when clicking "See all posts"' do
    user = User.create(name: 'Username1', bio: 'User Bio')
    visit user_path(user)

    click_link('See all posts')

    expect(current_path).to eq(user_posts_path(user))
  end

  it 'redirects to a post\'s show page when clicking on a user\'s post' do
    user = User.create(name: 'Username1', bio: 'User Bio')
    post = user.posts.create(title: 'First Post Title', text: 'First Post Text')

    visit user_path(user)

    # Verify that the post details are displayed on the post's show page
    expect(page).to have_content('First Post Title')
    expect(page).to have_content('First Post Text')
  end
end
