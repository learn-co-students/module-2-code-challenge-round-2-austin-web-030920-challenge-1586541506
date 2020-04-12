class GuestsController < ApplicationController

  def index
    @guests = Guest.all
  end

  def show
    @episode_rating = {}
    @guest = Guest.find(params[:id])

    @guest.appearances.each do |appearance| 
       if appearance.guest_id == @guest.id
        @episode_rating[appearance.episode_id] = appearance.rating
     end 
    end
  end
  
end


# def show
#   @guest_episodes = []
#   @guest_ratings = []
#   @guest = Guest.find(params[:id])

#   @guest.appearances.each do |appearance| 
#      if appearance.guest_id == @guest.id
#       @guest_episodes << appearance.episode_id
#       @guest_ratings << appearance.rating
#    end 
#   end

# end
# ###
# <% episode.guests.each do |n| %>
#   <% if n.name == @guest.name %>
#   <%binding.pry%>
#        <p>Rating:  <%= n.appearances.first.rating %></p>
#    <% end %> </p>
# <% end %><br>


