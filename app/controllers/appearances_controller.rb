class AppearancesController < ApplicationController

    def index
      @appearances = Appearance.all
      redirect_to new_appearance_path
    end

    def show
        @appearance = Appearance.find(params[:id])
    end

    def new
        @appearance = Appearance.new
    end

    def create
        @appearance = Appearance.new(appearance_params)
            if @appearance.valid?
                @appearance.save
                redirect_to episode_path(appearance_params[:episode_id])
            else
                render :new
            end
    end

    private

    def appearance_params
        params.require(:appearance).permit(:rating, :guest_id, :episode_id, :guest_id)
    end
end