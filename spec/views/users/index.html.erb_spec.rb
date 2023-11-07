require 'rails_helper'

RSpec.feature 'User Index Page', type: :feature do
  scenario 'displays user information' do
    user = User.create(name: 'Example User', bio: 'User Bio')
    visit users_path

    expect(page).to have_content('List of all users')
    expect(page).to have_content(user.name)
    expect(page).to have_selector('img.user-image[alt="User Image"]')
    expect(page).to have_content("Number of posts: #{user.posts.count}")
  end

  scenario 'clicking on a user redirects to their show page' do
    user = User.create(name: 'Example User', bio: 'User Bio')
    visit users_path
    click_link user.name

    expect(current_path).to eq(user_path(user))
  end
end
