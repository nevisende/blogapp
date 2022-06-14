class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author'
  belongs_to :post

  def update_comments_counter
    post.increment!(:comments_counter)
    post.save
  end
end
