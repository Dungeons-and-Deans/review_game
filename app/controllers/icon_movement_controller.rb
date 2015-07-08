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
    game_channel = message
    @icons = GroupAssignment.joins("LEFT JOIN groups ON groups.id = group_id and groups.game_session_id = #{game_channel}")
    WebsocketRails[:"group_listen#{game_channel}"].trigger 'initial_placement', @icons
  end

  def send_question
    game_channel = message
    WebsocketRails[:"group_listen#{game_channel}"].trigger 'ask_question'
  end

end
