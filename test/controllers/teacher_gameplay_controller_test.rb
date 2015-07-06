require 'test_helper'

class TeacherGameplayControllerTest < ActionController::TestCase
  setup do
    sign_in teachers(:three)
    @game_session = game_sessions(:one)
  end

  test "should get home" do
    get :home, id: @game_session.id
    assert_response :success
  end

  test "should get supplies" do
    get :supplies, id: @game_session.id
    assert_response :success
  end

  test "should get competition" do
    get :competition, id: @game_session.id
    assert_response :success
  end

end
