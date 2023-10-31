require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid with a title, comments_counter, and likes_counter greater than or equal to zero' do
    user = User.create(name: 'John', posts_counter: 0)
    post = Post.new(title: 'Test Post', comments_counter: 0, likes_counter: 0, author: user)
    expect(post).to be_valid
  end

  it 'is invalid without a title' do
    post = Post.new(comments_counter: 0, likes_counter: 0)
    expect(post).to_not be_valid
  end

  it 'is invalid with a long title' do
    post = Post.new(title: 'A' * 251, comments_counter: 0, likes_counter: 0)
    expect(post).to_not be_valid
  end

  it 'is invalid with a negative comments_counter' do
    user = User.create(name: 'John', posts_counter: 0)
    post = Post.new(title: 'Test Post', comments_counter: -1, likes_counter: 0, author: user)
    expect(post).to_not be_valid
  end

  it 'is invalid with a non-integer likes_counter' do
    user = User.create(name: 'John', posts_counter: 0)
    post = Post.new(title: 'Test Post', comments_counter: 0, likes_counter: 1.5, author: user)
    expect(post).to_not be_valid
  end

  describe '#recent_comments' do
    it 'returns the most recent comments limited by the specified limit' do
      user = User.create(name: 'John', posts_counter: 0)
      post = Post.new(title: 'Test Post', comments_counter: 0, likes_counter: 0, author: user)
      post.save!

      comments = []
      (1..10).each do |i|
        comment = Comment.create!(text: "Comment #{i}", post:, author: user)
        comments << comment
      end

      recent_comments = post.send(:recent_comments, 5)

      expect(recent_comments.to_a).to eq(comments.last(5).reverse)
    end
  end
end
