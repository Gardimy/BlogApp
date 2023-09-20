require 'rails_helper'

RSpec.describe 'Post Show Page', type: :feature do
  before do
    # Add setup code here if needed (e.g., create a post and comments)
  end

  it 'displays post details and comments' do
    visit post_path(Post.first)

    # Add Capybara assertions to check for post details and comments
    expect(page).to have_content('Hello')
    expect(page).to have_content('Posted by Username1')
    expect(page).to have_content('Comments: 2')
    expect(page).to have_content('Likes: 5')
    expect(page).to have_content('First Post Body')
    expect(page).to have_content('Commenter1:')
    expect(page).to have_content('Commenter1\'s Comment')
    expect(page).to have_content('Commenter2:')
    expect(page).to have_content('Commenter2\'s Comment')
  end
end
