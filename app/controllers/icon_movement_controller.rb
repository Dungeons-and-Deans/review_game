class IconMovementController < WebsocketRails::BaseController

  def move_icon
    @icon = GroupAssignment.find_by_id(message[:id])
    @icon.board_x = message[:x]
    @icon.board_y = message[:y]
    if @icon.save
      WebsocketRails[:group_listen].trigger 'coordinates', @icon
    else
      send_message :create_fail, icon, :namespace => :movements
    end

  end

  def place_icon
  end

end
