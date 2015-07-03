class GameSessionsController < ApplicationController
  before_action :set_game_session, only: [:groups, :assign_groups]

  def groups
  end

  def assign_groups
    if @game_session.update(game_session_params)
      redirect_to "/game_sessions/#{@game_session.id}/groups", notice: 'Game Session was successfully updated.'
    else
      render :groups
    end
  end

  private def set_game_session
    @game_session = GameSession.find(params[:id])
  end

  private def game_session_params
    params.require(:game_session).permit(:game_id, :turn_group_id,
      groups_attributes: [:id, :name, :score,
          group_assignments_attributes: [:id, :student_id, :board_x, :board_y]])
  end

end
