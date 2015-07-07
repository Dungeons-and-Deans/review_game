class IconMovementController < WebsocketRails::BaseController

  def move_icon
    @icon = GroupAssignment.find_by_id(1)
    @icon.board_x = message[:name]
    @icon.save
    send_message :worked, @icon, :namespace => :movements
    WebsocketRails[:group_listen].trigger 'coordinates', @icon

  end

  def place_icon


  end

end
