require 'test_helper'

class TeacherGameplayControllerTest < ActionController::TestCase
  setup do
    sign_in teachers(:one)
    @game_session = game_sessions(:one)
    @current_group = groups(:one)
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
