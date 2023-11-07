require 'rails_helper'

RSpec.feature 'Post Show Page', type: :feature do
  scenario 'displays comments and commenters' do
    user = User.create(name: 'Example User', bio: 'User Bio')
    post = user.posts.create(title: 'Example Post', text: 'Post Text')
    comment1 = post.comments.create(author: user, text: 'Comment 1')
    comment2 = post.comments.create(author: user, text: 'Comment 2')

    visit user_post_path(user, post)

    expect(page).to have_content(comment1.author.name)
    expect(page).to have_content(comment2.author.name)
    expect(page).to have_content(comment1.text)
    expect(page).to have_content(comment2.text)
  end
end
