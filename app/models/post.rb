class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  after_save :update_posts_counter

  def recent_five_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    user.increment!(:posts_counter)
  end
end
