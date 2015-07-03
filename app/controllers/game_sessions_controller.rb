class GameSessionsController < ApplicationController
  before_action :set_game_session, only: [:groups, :assign_groups]

  def groups
    @game_session.groups.build(password: SecureRandom.hex(8))
    @game_session.groups.each { |group| group.group_assignments.build }
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
    params.require(:game_session).permit(:game_id, :turn_group_id, :name,
      groups_attributes: [:id, :name, :score, :_destroy, :password,
          group_assignments_attributes: [:id, :student_id, :board_x, :board_y, :_destroy]])
  end

end
