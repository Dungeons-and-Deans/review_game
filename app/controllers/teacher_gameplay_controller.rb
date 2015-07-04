class TeacherGameplayController < ApplicationController
  before_action :set_game_session

  def home
    @current_group = @game_session.current_group
  end

  def supply
    @supply = Supply.new
  end

  def assign_supply
    @supply = Supply.new(supply_params)

    if @supply.save
      redirect_to teacher_gameplay_home_path, notice: 'Supply was successfully distributed.'
    else
      render :supply
    end
  end

  def supplies
    @groups = @game_session.groups
  end

  def competition
    @groups = @game_session.groups
  end

  private def set_game_session
    @game_session = GameSession.find(params[:id])
  end

  private def supply_params
    params.require(:supply).permit(:group_id, :name, :amount)
  end
end
