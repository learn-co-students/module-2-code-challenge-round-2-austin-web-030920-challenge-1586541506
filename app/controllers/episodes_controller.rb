class EpisodesController < ApplicationController

  def index
    @episodes = Episode.all
  end

  def show
    @episode = Episode.find(params[:id])
    @avg_rating = []

    @episode.appearances.each do |appearance|
      @avg_rating << appearance.rating
    end
  end


end
