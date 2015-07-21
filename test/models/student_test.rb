require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  setup do
    @game_session = game_sessions(:one)
    @student = students(:one)
    @group = groups(:one)
  end

  test "first and last makes full_name" do
    assert_equal "David Tennant", students(:one).full_name
  end

  test 'unassigned?' do
    refute @student.unassigned?(@game_session.id)
  end

  test 'active?' do
    assert_equal '<i class="fa fa-star-o"></i>', @student.active?(@group.id)
    assert_equal '<i class="fa fa-times"></i>', students(:two).active?(@group.id)
  end

end
