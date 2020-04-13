class Appearance < ApplicationRecord
    belongs_to :guest
    belongs_to :episode

    validates_presence_of :episode
    validates_presence_of :guest
    validates_uniqueness_of :guest, :scope => :episode
    validates_inclusion_of :rating, :in => 1..5
end
