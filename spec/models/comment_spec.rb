require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'is valid with content and a post_id' do
    user = User.create(name: 'John', posts_counter: 0)
    post = Post.create(title: 'Test Post', comments_counter: 0, likes_counter: 0, author: user)
    comment = Comment.new(text: 'Test comment', post: post, author: user)
    expect(comment).to be_valid
  end

  it 'is invalid without content' do
    user = User.create(name: 'John', posts_counter: 0)
    post = Post.create(title: 'Test Post', comments_counter: 0, likes_counter: 0, author: user)
    comment = Comment.new(post: post, author: user)
    expect(comment).to_not be_valid
  end

  it 'is invalid with too long content' do
    user = User.create(name: 'John', posts_counter: 0)
    post = Post.create(title: 'Test Post', comments_counter: 0, likes_counter: 0, author: user)
    comment = Comment.new(text: 'A' * 1001, post: post, author: user)
    expect(comment).to_not be_valid
  end

  it 'is invalid without a post_id' do
    user = User.create(name: 'John', posts_counter: 0)
    comment = Comment.new(text: 'Test comment', author: user)
    expect(comment).to_not be_valid
  end

  describe '#update_comments_counter' do
    it 'updates the post\'s comments_counter when a comment is saved' do
      user = User.create(name: 'John', posts_counter: 0)
      post = Post.create(title: 'Test Post', comments_counter: 0, likes_counter: 0, author: user)
      
      comment = Comment.new(text: 'Test comment', post: post, author: user)
      expect {
        comment.save
        post.reload
      }.to change(post, :comments_counter).by(1)
    end
  end
end
