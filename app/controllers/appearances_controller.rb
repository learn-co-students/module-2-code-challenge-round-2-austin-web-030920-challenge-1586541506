class AppearancesController < ApplicationController

  def new
    @appearance = Appearance.new
  end

  def create
    # created new appeaarance in table
    @appearance = Appearance.new(appearance_params)

    # saves new appearance
    if @appearance.save
        redirect_to :controller => 'episodes', :action => 'show', :id => appearance_params[:episode_id], :notice => "Added Appearance"
      else
        if @appearance.errors.full_messages[0] == "Guest has already been taken"
            flash[:notice] = "Error, this guest has already appeared in this episode!"
        else 
            flash[:notice] = "Error, this Rating nned to be between 1-5!"
        end
        redirect_to :controller => 'appearances', :action => 'new'
      end

  end

  private

  # allowing to pull episode and guest id off of parameters
  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating)
  end

  #   def create
  #   @rating = @article.ratings.new :value => params[:value]
  #   
  # end

  # def update
  #   @rating = Rating.find(params[:id])
  #   @rating.update_attribute :value, params[:value]
  # end

  # private
  #   def set_article
  #     @article = Article.find(parms[:article_id])
  #   end
end