class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent
        k = self.posts.last(5)
        k
    end


    def getting_likes
        k = self.posts.map do |post|
            post.likes
        end
        k
    end



    def highest_likes
        k = self.getting_likes.max
        post = self.posts.find_by(:likes => k)
    end


    def uniq_bloggers
        self.bloggers.uniq
    end

    def bloggers_ages
        self.uniq_bloggers.map do |blogger|
            blogger.age
        end
    end

    def bloggers_average
        (self.bloggers_ages.sum / self.bloggers_ages.size)
    end




end
