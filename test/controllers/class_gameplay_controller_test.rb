require 'test_helper'

class ClassGameplayControllerTest < ActionController::TestCase
  setup do
    @game_session = game_sessions(:one)
    @group = groups(:one)
    @game_session.update(turn_group_id: @group.id)
  end

  test "should get home" do
    get :home, id: @game_session
    assert_response :success
  end

end
