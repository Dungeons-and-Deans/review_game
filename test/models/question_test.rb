require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  setup do
    @question = questions(:one)
  end

  test "percent correct" do
    assert_equal 20, @question.percent_correct
  end

  test 'give points' do
    assert_difference('Group.first.score', 1) do
      @question.give_points(Group.first)
    end
  end
end
