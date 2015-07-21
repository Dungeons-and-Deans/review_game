require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  setup do
    @teacher = teachers(:one)
  end

  test 'available games includes defaults' do
    assert_equal 3, @teacher.available_games.count
  end
end
