require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name and posts_counter greater than or equal to zero' do
    user = User.new(name: 'John', posts_counter: 0)
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = User.new(posts_counter: 0)
    expect(user).to_not be_valid
  end

  it 'is invalid with a negative posts_counter' do
    user = User.new(name: 'John', posts_counter: -1)
    expect(user).to_not be_valid
  end

  it 'is invalid with a non-integer posts_counter' do
    user = User.new(name: 'John', posts_counter: 1.5)
    expect(user).to_not be_valid
  end

  describe '#recent_posts' do
    it 'returns the most recent posts' do
      user = User.create(name: 'John', posts_counter: 0)

      # Create some posts for the user with different timestamps
      user.posts.create(title: 'Post 1', text: 'Content 1', created_at: 2.days.ago)
      user.posts.create(title: 'Post 2', text: 'Content 2', created_at: 1.day.ago)
      post3 = user.posts.create(title: 'Post 3', text: 'Content 3', created_at: Time.now)

      # Call the recent_posts method with a limit of 2
      recent_posts = user.recent_posts(2)

      # Expect the method to return the most recent posts (limited to 2)
      expect(recent_posts).to eq([post3])
    end

    it 'returns all posts when the limit is greater than the number of posts' do
      user = User.create(name: 'John', posts_counter: 0)

      user.posts.create(title: 'Post 1', text: 'Content 1')
      user.posts.create(title: 'Post 2', text: 'Content 2')

      recent_posts = user.recent_posts(3)

      expect(recent_posts).to eq([user.posts.last, user.posts.first])
    end
  end
end
