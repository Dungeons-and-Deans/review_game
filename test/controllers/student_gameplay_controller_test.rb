require 'test_helper'

class StudentGameplayControllerTest < ActionController::TestCase
  setup do
    @game = games(:one)
    @group = groups(:one)
    @game_session = game_sessions(:one)
    @game_session.update(turn_group_id: @group.id)
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get home" do
    get :home, id: @game, group_id: @group
    assert_response :success
  end

end
