require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'is valid with a post_id' do
    user = User.create(name: 'John', posts_counter: 0)
    post = Post.create(title: 'Test Post', comments_counter: 0, likes_counter: 0, author: user)
    like = Like.new(post: post, author: user)
    expect(like).to be_valid
  end

  it 'is invalid without a post_id' do
    user = User.create(name: 'John', posts_counter: 0)
    like = Like.new(author: user)
    expect(like).to_not be_valid
  end
end
