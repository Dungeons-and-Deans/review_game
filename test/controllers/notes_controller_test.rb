require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  setup do
    @note = notes(:one)
  end

  test "should create note" do
    assert_difference('Note.count') do
      post :create, format: :js, note: { content: @note.content, group_id: @note.group_id }
    end

    assert_response :success
  end

  test "should get edit" do
    xhr get: :edit, format: :js, id: @note
    assert_response :success
  end

  test "should update note" do
    patch :update, format: :js, id: @note, note: { content: @note.content, group_id: @note.group_id }
    assert_response :success
  end

  test "should destroy note" do
    assert_difference('Note.count', -1) do
      delete :destroy, format: :js, id: @note
    end
  end
end
