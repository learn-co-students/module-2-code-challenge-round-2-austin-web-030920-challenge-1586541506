class Appearance < ApplicationRecord
  belongs_to :guest
  belongs_to :episode

  validates :rating, numericality: {less_than_or_equal_to: 5 }
  validate :guest_cant_appear_on_episode_more_than_once

  def guest_cant_appear_on_episode_more_than_once
    if self.class.find_by(guest: self.guest, episode: self.episode)
      errors.add(:guests, "can't appear on the same episode more than once")
    end
  end

end
