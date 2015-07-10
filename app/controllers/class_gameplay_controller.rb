class ClassGameplayController < ApplicationController
  def home
    @game_session = GameSession.find(params[:id])
    @map = Map.find_by_game_id(@game_session.game.id)
    @players = @game_session.group_assignments
    @icon = @game_session.icon
  end
end
