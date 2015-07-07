class GameSessionsController < ApplicationController
  before_action :set_game_session, only: [:groups, :assign_groups, :destroy]
  before_action :authenticate_teacher!

  def new
    @game_session = GameSession.new
    @game_session.category_game_session_assignments.build
    @categories = Category.where(teacher_id: current_teacher.id)
  end

  def create
    @game_session = GameSession.new(game_session_params)
    if @game_session.save
      @game_session.begin_game(params[:category], params[:number_of_groups])
      redirect_to "/game_sessions/#{@game_session.id}/groups"
    else
      render :new
    end
  end

  def groups
    @students = Student.where(teacher_id: current_teacher.id).select{ |s| s.unassigned?(@game_session.id) }
  end

  def assign_groups
    if @game_session.update(game_session_params)
      redirect_to "/teacher_gameplay/#{@game_session.id}/home", notice: 'Game Session was successfully updated.'
    else
      render :groups
      flash[:notice] = @game_session.errors
    end
  end

  def add_player
    @game_session = Group.find(params[:group_id]).game_session
    GroupAssignment.assign(params[:group_id], params[:student_id], @game_session.id)
    redirect_to "/game_sessions/#{@game_session.id}/groups"
  end

  def destroy
    @game_session.destroy
    redirect_to games_url, notice: 'Game was successfully destroyed.'
  end

  private def set_game_session
    @game_session = GameSession.find(params[:id])
  end

  private def game_session_params
    params.require(:game_session).permit(:game_id, :turn_group_id, :name,
    category_game_session_assignments_attributes: [:id, :category_id, :_destroy],
    groups_attributes: [:id, :name, :score, :_destroy, :password,
        group_assignments_attributes: [:id, :student_id, :board_x, :board_y, :_destroy]])
  end

end
