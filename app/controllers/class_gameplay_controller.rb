class ClassGameplayController < ApplicationController
  def home
    @game_session = GameSession.find(params[:id])
    @map = Map.find_by_game_id(@game_session.game.id)
  end
end
