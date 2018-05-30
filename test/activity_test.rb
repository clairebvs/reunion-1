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

  def test_an_activity_starts_with_no_participants
    activity = Activity.new("hiking")
    assert_equal ({}), activity.participants
  end

  def test_can_add_participants_to_activity
    activity = Activity.new("hiking")

    activity.add_participants("George", 20)
    activity.add_participants("Louis", 40)

    assert_equal ({"George" => 20, "Louis" => 40}), activity.participants
  end

  def test_activity_has_a_base_cost_of_50_by_default
    activity = Activity.new("hiking")

    assert_equal 50, activity.base_cost
  end

  def test_expensive_activity_have_different_base_cost
    activity = Activity.new("stand up paddling", 100)

    assert_equal 100, activity.base_cost
  end

  def test_activity_has_total_cost
    activity = Activity.new("hiking")

    activity.add_participants("George", 20)
    activity.add_participants("Louis", 40)
    assert_equal 110, activity.total_cost
  end
end
