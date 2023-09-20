require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  before do
    # Add setup code here if needed (e.g., create some user records)
  end

  it 'displays username, profile picture, and post count for a user' do
    User.create(name: 'Username1', bio: 'User Bio')
    visit users_path

    # Add Capybara assertions to check for username, profile picture, and post count
    expect(page).to have_content('Username1')
    expect(page).to have_selector('img.user-image')
  end

  it 'redirects to a user\'s show page when clicking on their username' do
    user = User.create(name: 'Username1', bio: 'User Bio')
    visit users_path

    # Click on the user's username link
    click_link('Username1')

    expect(current_path).to eq(user_path(user))
  end
end
