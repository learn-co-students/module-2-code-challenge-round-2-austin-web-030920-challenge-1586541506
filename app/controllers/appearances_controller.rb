class AppearancesController < ApplicationController

  def index
    @appearances = Appearance.all
  end

  def show
    @appearance = Appearance.find(params[:id])
  end

  def new
    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.new(app_params)
    if @appearance.save
        redirect_to episode_path(@appearance.episode)
    else
        render 'new'
    end 

  end

  private
  def app_params
    params.require(:appearance).permit(:rating, :guest_id, :episode_id)
  end
end 
