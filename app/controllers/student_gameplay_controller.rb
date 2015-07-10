class StudentGameplayController < ApplicationController
  before_action :logged_in?, only: [:home]

  def login
    if request.post?
      group = Group.find_by_password(params[:password]["password"])
      if group
        redirect_to "/student_gameplay/#{group.game_session_id}/home/#{group.id}", notice: "Logged in."
      else
        flash.now[:notice] = "Incorrect Password"
      end
    end
  end

  def home
    @group = Group.find_by_id(params[:group_id])
    @game_session = GameSession.find(@group.game_session_id)
    @map = Map.find_by_game_id(@game_session.game.id)
    @players = @game_session.group_assignments.where(group_id: @group.id)
    @icon = @game_session.icon
  end

  def logout
    redirect_to student_gameplay_login_path, notice: "Successfully logged out."
  end

  private def logged_in?

  end

end
