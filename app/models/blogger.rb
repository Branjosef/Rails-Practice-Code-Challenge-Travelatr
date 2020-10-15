class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, :age, presence: true
    validates :name, uniqueness: true
    validates :age, numericality: { minimum: 1 }
    validates :bio, length: { minimum: 30 }

    def getting_likes
        k = self.posts.map do |post|
            post.likes
        end
        k
    end

    def sum_likes
        k = self.getting_likes
        k.sum
    end

    def highest_likes
        k = self.getting_likes.max
        post = self.posts.find_by(:likes => k)
    end


end
