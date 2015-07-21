require 'test_helper'

class SuppliesControllerTest < ActionController::TestCase

  setup do
    sign_in teachers(:three)
    @game_session = game_sessions(:one)
    @supply = supplies(:one)
    @group = groups(:one)
  end

  test "should get create" do
    assert_difference('Supply.count', 1) do
      post :create, format: :js, id: @game_session, group_id: @group, supply: { name: @supply.name, amount: @supply.amount, group_id: @group.id }
    end
  end

  test "should get edit" do
    xhr :get, :edit, id: @supply, format: "js"
    assert_response :success
  end

  test "should get update" do
    patch :update, format: :js, id: @group, supply_id: @supply, supply: { name: @supply.name, amount: @supply.amount }
    assert_response :success
  end

  test "should get destroy" do
    assert_difference('Supply.count', -1) do
      delete :destroy, format: :js, id: @group, supply_id: @supply
    end
  end

end
