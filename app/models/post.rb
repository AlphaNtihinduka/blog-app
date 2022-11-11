class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  after_save :update_posts_counter
  after_destroy :update_counters

  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_five_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_counters
    author.update(posts_counter: author.posts.count)
  end 

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
