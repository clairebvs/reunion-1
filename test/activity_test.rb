require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def test_it_exists
    activity = Activity.new("hiking")
    assert_instance_of Activity, activity
  end

  def test_activity_has_name
    activity = Activity.new("hiking")
    assert_equal "hiking", activity.name
  end

  def test_can_have_different_activity_name
    activity = Activity.new("stand up paddling")
    assert_equal "stand up paddling", activity.name
  end

end
