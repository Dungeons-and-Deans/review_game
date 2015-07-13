class SuppliesController < ApplicationController
  before_action :set_supply, only: [:edit, :update, :destroy]
  before_action :set_game_session

  def create
    @supply = Supply.new(supply_params)
    @supply.save
    @current_group = @game_session.current_group
    respond_to do |format|
      format.js
    end
    send_supplies
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @supply.update(supply_params)
        format.js
      else
        format.html { render :groups, notice: 'Supply failed to be updated.' }
      end
    end
    send_supplies
  end

  def destroy
    @id = params[:supply_id]
    @supply.destroy
    respond_to do |format|
      format.js
    end
    send_supplies
  end

  private def set_supply
    @supply = Supply.find(params[:supply_id])
  end

  private def set_game_session
    @game_session = GameSession.find(params[:id])
  end

  private def supply_params
    params.require(:supply).permit(:group_id, :name, :amount)
  end

  private def send_supplies
    current_group = @game_session.current_group
    supplies = Supply.where(:group_id current_group)
    WebsocketRails[:"question_listen#{current_group}"].trigger 'update_supplies', supplies
  end
end
