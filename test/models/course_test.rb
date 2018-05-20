require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "the truth" do
    course = Course.new(title: 'Ruby', user_id: 2)
    assert_equal 'Ruby', course.title
    assert_equal 1, course.user_id
    end
 end
