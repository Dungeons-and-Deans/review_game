require 'test_helper'
require 'categories_controller.rb'

class CategoriesControllerTest < ActionController::TestCase

  setup do
    sign_in teachers(:three)
    @category = categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
    assert_difference('Category.count', 1) do
      get :new
    end
  end

  test "should show category" do
    get :show, id: @category
    assert_response :success
  end

  test "should get edit" do
    xhr :get, :edit, id: @category, format: "js"
    assert_response :success
  end

  test "should update category" do
    patch :update, format: :js, id: @category, category: { name: @category.name, teacher_id: @category.teacher_id }
    assert_response :success
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete :destroy, format: :js, id: @category
    end
  end
end
