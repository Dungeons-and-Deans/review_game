class GameSessionsController < ApplicationController
  before_action :set_game_session, only: [:groups, :edit, :update, :assign_groups, :destroy, :end_game, :add_player, :update_map, :add_group]
  before_action :authenticate_teacher!

  def new
    @game = Game.find(params[:game_id])
    @game_session = GameSession.new(game_id: @game.id)
    @game_session.category_game_session_assignments.build
    @categories = Category.where(teacher_id: current_teacher.id)

    respond_to do |format|
      format.js
    end
  end

  def edit
    @categories = Category.where(teacher_id: current_teacher.id)

    respond_to do |format|
      format.js
    end
  end

  def update
    @game_session.update(game_session_params)
    redirect_to games_path
  end

  def add_group
    @game_session.make_groups(1)
    @game_session.save

    respond_to do |format|
      format.js
    end
  end

  def create
    @game_session = GameSession.new(game_session_params)
    if @game_session.save
      unless @game_session.game.teacher_id
        @game_session.update(teacher_id: current_teacher.id)
      end
      @game_session.begin_game(params[:category], params[:number_of_groups])
      redirect_to game_session_groups_path(@game_session)
    else
      redirect_to games_path, notice: "Game session failed to be created."
    end
  end

  def groups
    @students = Student.where(teacher_id: current_teacher.id).order(:last_name).select{ |s| s.unassigned?(@game_session.id) }
  end

  def assign_groups
    if @game_session.update(game_session_params)
      @game_session.check_for_group_names
      redirect_to teacher_gameplay_path(@game_session), notice: 'Game Session was successfully updated.'
    else
      render :groups
      flash[:notice] = @game_session.errors
    end
  end

  def add_player
    GroupAssignment.assign(params[:group_id], params[:student_id], @game_session.id)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @game_session.destroy
    redirect_to games_url, notice: 'Game was successfully destroyed.'
  end

  def end_game
    @game_session.update(game_session_params)
    @group = Group.find(@game_session.winning_group_id)
    @group.new_win
  end

  def update_map
    @game_session.update(game_session_params)

    respond_to do |format|
      format.js
    end
  end

  private def set_game_session
    @game_session = GameSession.find(params[:id])
  end

  private def game_session_params
    params.require(:game_session).permit(:game_id, :turn_group_id, :name,
        :winning_group_id, :icon_id, :min_difficulty, :canvas, :canvas_file_name, :canvas_content_type,
        category_game_session_assignments_attributes: [:id, :category_id, :_destroy],
        groups_attributes: [:id, :name, :score, :_destroy, :password,
        group_assignments_attributes: [:id, :student_id, :active, :board_x, :board_y, :_destroy]])
  end

end
