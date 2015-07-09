class TeacherGameplayController < ApplicationController
  before_action :set_game_session

  def home
    @current_group = @game_session.current_group
    @question = @game_session.random_question
    @supply = Supply.new
  end

  def supply
  end

  def assign_supply
    @supply = Supply.new(supply_params)

    if @supply.save
      redirect_to "/teacher_gameplay/#{@game_session.id}/home", notice: 'Supply was successfully distributed.'
    else
      render :supply
    end
  end

  def groups
    @groups = @game_session.groups
    @supply = Supply.new
  end

  def competition
    @groups = @game_session.groups
  end

  def edit_score
    @group = Group.find(params[:group_id])
    respond_to do |format|
      format.js
    end
  end

  def update_score
    @group = Group.find(params[:group_id])
    respond_to do |format|
      if @group.update(group_params)
        format.js
      else
        format.html { render :home, notice: 'Score failed to be updated.' }
      end
    end
  end

  def next_group
    if @game_session.update(game_session_params)
      redirect_to "/teacher_gameplay/#{@game_session.id}/home"
    else
      render :home, notice: "Try Again"
    end
  end

  def active
    student_group = Group.find_by_game_session_id(params[:id])
    @student = GroupAssignment.where(student_id: params[:student_id]).first
    if @student.active
      @student.update(active: false)
    else
      @student.update(active: true)
    end
    WebsocketRails[:"group_listen#{student_group.game_session_id}"].trigger 'icon_display', @student


    respond_to do |format|
      format.js
    end
  end

  private def set_game_session
    @game_session = GameSession.find(params[:id])
  end

  private def group_params
    params.require(:group).permit(:score)
  end

  private def game_session_params
    params.require(:game_session).permit(:turn_group_id, :name)
  end

  private def supply_params
    params.require(:supply).permit(:group_id, :name, :amount)
  end
end
