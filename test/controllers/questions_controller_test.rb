require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup do
    sign_in teachers(:one)
    @question = questions(:one)
  end

  test "should get edit" do
    xhr :get, :edit, id: @question, format: "js"
    assert_response :success
  end

  test "should get update" do
    patch :update, format: :js, id: @question, question: { content: @question.content, difficulty_level: 2 }
    assert_response :success
  end

  test "should get destroy" do
    assert_difference('Question.count', -1) do
      delete :destroy, format: :js, id: @question
    end
  end

end
