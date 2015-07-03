require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  test "first and last makes full_name" do
    assert_equal "David Tennant", students(:one).full_name
  end

end
