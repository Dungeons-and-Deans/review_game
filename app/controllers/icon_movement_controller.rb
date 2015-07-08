class IconMovementController < WebsocketRails::BaseController

  def move_icon
    @icon = GroupAssignment.find_by_id(message[:id])
    @icon.board_x = message[:x]
    @icon.board_y = message[:y]
    game_channel = @icon.group.game_session_id
    if @icon.save
      WebsocketRails[:"group_listen#{game_channel}"].trigger 'coordinates', @icon
    else
      send_message :create_fail, icon, :namespace => :movements
    end

  end

  def place_icon
    # @icons = GroupAssignment.where(game_session_id: params[:id])
    # game_channel = params[:id]
    # byebug
    # WebsocketRails[:"group_listen#{game_channel}"].trigger 'initial_placement', @icons
  end

end
