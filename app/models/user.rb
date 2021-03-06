class User < ApplicationRecord
  has_many :posts, foreign_key: 'author', dependent: :destroy
  has_many :likes, foreign_key: 'author', dependent: :destroy
  has_many :comments, foreign_key: 'author', dependent: :destroy

  validates :name, presence: true, allow_blank: false
  validates :post_counter, numericality: { only_integer: true, greater_than: -1 }

  def recent_posts
    posts.order('created_at DESC').limit(3)
  end
end
