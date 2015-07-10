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
    @supply.save
    @current_group = @game_session.current_group
    respond_to do |format|
      format.js
    end
  end

  def groups
    @groups = @game_session.groups
    @supply = Supply.new
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
    @assignment = GroupAssignment.joins("INNER JOIN groups ON groups.id = group_assignments.group_id and group_assignments.student_id = #{params[:student_id]} and groups.game_session_id = #{params[:id]}").last
    if @assignment.active
      @assignment.update(active: false)
    else
      @assignment.update(active: true)
    end
    WebsocketRails[:"group_listen#{params[:id]}"].trigger 'icon_display', @assignment

    respond_to do |format|
      format.js
    end
  end

  def next_question
    @question = Question.find(params[:question_id])
    @question.give_points(@game_session.turn_group_id) if params[:question][:right]
    @question.update(question_params)
    @question = @game_session.random_question

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
    params.require(:game_session).permit(:turn_group_id, :name, :winning_group_id)
  end

  private def supply_params
    params.require(:supply).permit(:group_id, :name, :amount)
  end

  private def question_params
    params.require(:question).permit(:right, :wrong)
  end
end
