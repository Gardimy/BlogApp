require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  before do
    # Add setup code here if needed (e.g., create user and posts)
  end

  it 'displays username, profile picture, and post count for a user' do
    User.create(name: 'Username1', bio: 'User Bio')
    visit users_path

    expect(page).to have_content('Username1')
    expect(page).to have_selector('img.user-image[alt="User Image"]')
    expect(page).to have_content('Number of posts: 0')
  end
end
