class User < ApplicationRecord
  has_many :posts, foreign_key: 'author', dependent: :destroy
  has_many :likes, foreign_key: 'author', dependent: :destroy
  has_many :comments, foreign_key: 'author', dependent: :destroy

  def recent_posts
    posts.order('created_at DESC').limit(3)
  end
end
