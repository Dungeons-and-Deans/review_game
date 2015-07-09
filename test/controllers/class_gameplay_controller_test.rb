require 'test_helper'

class ClassGameplayControllerTest < ActionController::TestCase
  setup do
    @game_session = game_sessions(:one)
  end

  test "should get home" do
    get :home, id: @game_session
    assert_response :success
  end

end
