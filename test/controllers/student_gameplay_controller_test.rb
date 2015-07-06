require 'test_helper'

class StudentGameplayControllerTest < ActionController::TestCase
  setup do
    @game = games(:one)
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get home" do
    get :home
    assert_response :success
  end

end
