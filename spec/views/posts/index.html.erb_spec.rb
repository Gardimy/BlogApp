require 'rails_helper'

RSpec.describe 'User Post Index Page', type: :feature do
  before do
    # Add setup code here if needed (e.g., create user and posts)
  end

  it 'displays user profile information and post details' do
    visit user_posts_path(User.first)

    # Add Capybara assertions to check for user profile information and post details
    expect(page).to have_content('Tom')
    expect(page).to have_selector('img.user-image')
    expect(page).to have_content('Number of Posts: 3')
    expect(page).to have_content('First Post Title')
    expect(page).to have_content('First Post Body')
    expect(page).to have_content('Comments: 2')
    expect(page).to have_content('Likes: 5')
  end

  it 'redirects to a post\'s show page when clicking on a post title' do
	visit user_posts_path(User.first)
  
	# Click on a post title link
	click_link('Hello')

	# Add Capybara assertions to check that you are on the post's show page
	expect(current_path).to eq(post_path(Post.first))
	expect(page).to have_content('First Post Title')
	expect(page).to have_content('Posted by Username1')
  end  
end
