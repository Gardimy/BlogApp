class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  validates :text, presence: true
  validates :text, length: { maximum: 1000 }
  validates :post_id, presence: true

  after_save :update_comments_counter

  private

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
