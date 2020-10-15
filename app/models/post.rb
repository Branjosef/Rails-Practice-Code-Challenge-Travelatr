class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination

    def add_like
        self.likes =+1
    end
end
