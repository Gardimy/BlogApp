require 'rails_helper'

RSpec.describe 'User Post Index Page', type: :feature do
  before do
    # Add setup code here if needed (e.g., create user and posts)
  end

  it 'displays user profile information and post details' do
    visit user_posts_path(User.first)

    expect(page).to have_content('Gardimy')
    expect(page).to have_selector('img.user-image')
    expect(page).to have_content('Number of Posts: 0')
  end
end
