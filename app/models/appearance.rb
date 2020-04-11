class Appearance < ApplicationRecord
    belongs_to :episode
    belongs_to :guest
    validates :rating, numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 0}

end