require 'test_helper'

class TeacherGameplayControllerTest < ActionController::TestCase
  setup do
    sign_in teachers(:one)
    @game_session = game_sessions(:one)
    group = Group.create(name: "group1", game_session_id: @game_session.id, score: 100, password: "password")
    @game_session.update(turn_group_id: group.id)
  end

  test "should get home" do
    get :home, id: @game_session.id
    assert_response :success
  end

  test "should get groups" do
    get :groups, id: @game_session.id
    assert_response :success
  end

  test "should get competition" do
    get :competition, id: @game_session.id
    assert_response :success
  end

end
