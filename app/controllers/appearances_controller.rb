class AppearancesController < ApplicationController
  def new
    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.new(appear_params)

    if @appearance.valid?
      @appearance.save
      redirect_to episode_path(appear_params[:episode_id])
    else
      @errors = @appearance.errors
      render "new"
    end
  end

  private

  def appear_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating)
  end
end
