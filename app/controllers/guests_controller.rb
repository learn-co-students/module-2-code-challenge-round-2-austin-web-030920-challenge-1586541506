class GuestsController < ApplicationController

  def index
    @guests = Guest.all
  end

  def show
    @episode_rating = {}
    @gedr = {}
    @guest = Guest.find(params[:id])
    #@gedr --> guest: episode, date, rating

    @guest.appearances.each do |appearance| 
       if appearance.guest_id == @guest.id
        @episode_rating[appearance.episode_id] = appearance.rating
     end 
    end

    @guest.episodes.each do |episode|
      @gedr[episode] = [episode.number]
      @gedr[episode].push("#{episode.date}")

        @episode_rating.each_key do |r|
          if episode[:id] == r
            @gedr[episode].push(@episode_rating[r])
          end
        end
      end
  @omg = @gedr.sort_by {|r| r[1][2]}.reverse.to_h
  end
end