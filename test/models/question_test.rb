require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  setup do
    @question = questions(:one)
  end

  test "percent correct" do
    assert_equal 20, @question.percent_correct
  end
  # test "the truth" do
  #   assert true
  # end
end
