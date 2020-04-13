class Appearance < ApplicationRecord
    belongs_to :guest
    belongs_to :episode
    validates :rating, presence: true
    validates :rating, numericality: { greater_than: 0, less_than_or_equal_to: 5 }
    validates :guest_id, uniqueness: { scope: :episode,
        message: "may only appear on an episode once." }

        #next time use something other than "numericality" to prevent user from adding rating that is not whole. 


end


