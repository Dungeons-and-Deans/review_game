class IconMovementController < WebsocketRails::BaseController

  def move_icon
    @icon = GroupAssignment.find_by_id(1)
    @icon.board_x = 55
    @icon.save
     send_message :worked, @icon, :namespace => :movements

  end

  def place_icon


  end

end
