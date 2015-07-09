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
    @game_session = GameSession.find(message)
    WebsocketRails[:"question_listen#{@game_session.turn_group_id}"].trigger 'ask_question'
  end

  def send_competition_question
    message.length.times do |i|
      game_channel = message[i-1]
      WebsocketRails[:"question_listen#{game_channel}"].trigger 'ask_competition_question'
    end
  end

end
