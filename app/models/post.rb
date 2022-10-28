class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :likes
    after_save :update_posts_counter
    
    private
    def update_posts_counter
        user.increment!(:posts_counter)
    end
end
