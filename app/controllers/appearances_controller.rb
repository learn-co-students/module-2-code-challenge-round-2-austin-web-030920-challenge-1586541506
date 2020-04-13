class AppearancesController < ApplicationController
    def index
        @appearance = Appearance.all
    end

    def new
        @appearance = Appearance.new
    end
    
    def create
        @appearance = Appearance.create(appearance_hash)
        #byebug
        redirect_to episode_path(@appearance_hash[:episode_id])
    end

    private

    def appearance_hash
        params.require(:appearance).permit(:guest_id, :episode_id, :rating)
    end
    
end
