require 'rails_helper'

RSpec.describe 'User Post Index Page', type: :feature do
  before do
  end

  it 'displays user profile information and post details' do
    visit user_posts_path(User.first)

    expect(page).to have_content('Tom')
    expect(page).to have_selector('img.user-image')
    expect(page).to have_content('Number of Posts: 3')
  end

  it 'redirects to a post\'s show page when clicking on a post title' do
    visit user_posts_path(User.first)

    click_link('Hello')

    expect(current_path).to eq(post_path(Post.first))
  end
end
