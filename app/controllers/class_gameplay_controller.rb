class ClassGameplayController < ApplicationController
  before_filter :set_cache_buster

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end


  def home
    @game_session = GameSession.find(params[:id])
    @map = Map.find_by_game_id(@game_session.game.id)
    @players = @game_session.group_assignments
    @icon = @game_session.icon
  end
end
