class Episode < ApplicationRecord
    has_many :appearances
    has_many :guests, through: :appearances

    

    def average_rating
        # find the sum of all the ratings
        self.appearances.sum(0.0) do |appearance|
            appearance.rating
        end / #divide by the number of appearances
        self.appearances.count
    end
end
