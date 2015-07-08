class StudentGameplayController < ApplicationController
  def login
    if request.post?
      group = Group.find_by_password(params[:password]["password"])
      if group
        session[:group_id] = group.id
        redirect_to student_gameplay_home_path, notice: "Logged in."
      else
        flash.now[:notice] = "Incorrect Password"
      end
    end
  end

  def home
    @group = Group.find_by_id(session[:group_id])
    @game_session = GameSession.find(@group.game_session_id)
    @map = Map.find_by_game_id(@game_session.game.id)
    @players = @game_session.group_assignments.where(group_id: @group.id)
    @icon = @game_session.game.icon
  end

  def logout
    session[:group_id] = nil
    redirect_to student_gameplay_login_path, notice: "Successfully logged out."
  end

end
