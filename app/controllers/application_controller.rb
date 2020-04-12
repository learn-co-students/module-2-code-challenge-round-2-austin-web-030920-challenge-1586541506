class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #access to @appearances ## Appearances.all ## on all pages
  # def all_appearances
  # @appearances ||= all_appearances
  # end

end
