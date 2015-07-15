class TeacherGameplayController < ApplicationController
  before_action :set_game_session

  def home
    @current_group = @game_session.current_group
    @question = @game_session.random_question
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
    WebsocketRails[:"group_listen#{@group.game_session_id}"].trigger 'update_score', @group
  end

  def next_group
    if @game_session.update(game_session_params)
      @current_group = @game_session.current_group
      @supply = Supply.new
      @question = @game_session.random_question
      respond_to do |format|
        format.js
      end
    else
      render :home, notice: "Try Again"
    end
    turn_group_name = Group.find(@game_session.turn_group_id).name
    WebsocketRails[:"group_listen#{@game_session.id}"].trigger 'turn_display', turn_group_name
  end

  def active
    @assignment = GroupAssignment.joins("INNER JOIN groups ON groups.id = group_assignments.group_id and group_assignments.student_id = #{params[:student_id]} and groups.game_session_id = #{params[:id]}").last
    if @assignment.active == true
      @assignment.update(active: false)
    else
      @assignment.update(active: true)
    end

    respond_to do |format|
      format.js
    end
    WebsocketRails[:"group_listen#{params[:id]}"].trigger 'icon_display', @assignment
    active_list
  end

  def next_question
    @question = Question.find(params[:question_id])
    if params[:question][:right]
      group = Group.find(params[:group_id])
      @question.give_points(group.id)
      WebsocketRails[:"group_listen#{group.game_session_id}"].trigger 'update_score', group
    end
    @question.update(question_params)
    @question = @game_session.random_question

    respond_to do |format|
      format.js
    end
  end

  def send_message
    @message = params[:message_text]
    respond_to do |format|
      format.js
    end
    WebsocketRails[:"question_listen#{params[:group]}"].trigger 'send_message', @message
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

  private def active_list
    group_list = []
    group = Group.find(@assignment.group_id)
    group.students.order(:last_name).each do |student|
      group_list << "#{student.full_name} #{student.active?(group.id)}"
    end
    WebsocketRails[:"question_listen#{group.id}"].trigger 'group_list', group_list
  end

end
