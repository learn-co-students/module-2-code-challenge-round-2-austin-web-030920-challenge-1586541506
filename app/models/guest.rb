class Guest < ApplicationRecord
    has_many :appearances
    has_many :episodes, through: :appearances

    def sort_episodes_by_rating
        self.episodes.sort_by { |episode| episode.average_rating }.reverse
    end
end
