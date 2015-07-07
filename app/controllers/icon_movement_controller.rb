class IconMovementController < WebsocketRails::BaseController

  def move_icon
    @icon = GroupAssignment.find_by_id(1)
    @icon.board_x = message[:x]
    @icon.board_y = message[:y]
    @icon.save
    WebsocketRails[:group_listen].trigger 'coordinates', @icon

  end

  def place_icon


  end

end
