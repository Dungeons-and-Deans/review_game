require 'test_helper'

class TeacherGameplayControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get supplies" do
    get :supplies
    assert_response :success
  end

  test "should get competition" do
    get :competition
    assert_response :success
  end

end
