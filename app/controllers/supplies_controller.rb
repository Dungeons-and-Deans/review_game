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
  end

  def edit
  end

  def update
  end

  def destroy
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
end
