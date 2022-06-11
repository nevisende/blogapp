class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def update_posts_counter
    author.increment!(:post_counter)
    author.save
  end

  def recent_comments
    comments.order('created_at DESC').includes(:author).limit(5)
  end
end
