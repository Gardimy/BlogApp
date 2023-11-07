require 'rails_helper'

RSpec.feature 'Post Index Page', type: :feature do
  scenario 'displays post information' do
    user = User.create(name: 'Example User', bio: 'User Bio')
    post = user.posts.create(title: 'Example Post', text: 'Post Text')
    visit user_posts_path(user)

    expect(page).to have_content(user.name)
    expect(page).to have_css('img.user-image[alt="User Image"]')
    expect(page).to have_content(post.title)
    expect(page).to have_content("Number of Posts: #{user.posts.count}")
    expect(page).to have_content(post.text)
    expect(page).to have_content("#{post.comments.count} Comments")
    expect(page).to have_content("#{post.likes.count} Likes")
  end
end
