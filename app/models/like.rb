class Like < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  validates :post_id, presence: true

  after_create :increment_like_counter

  private

  def increment_like_counter
    post.increment(:likes_counter)
  end
end
