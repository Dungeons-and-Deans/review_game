require 'test_helper'

class StudentGameplayControllerTest < ActionController::TestCase
  setup do
    @game = games(:one)
    @group = groups(:one)
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
