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

    assert_equal 10, activity.base_cost
  end

  def test_expensive_activity_have_different_base_cost
    activity = Activity.new("stand up paddling", 20)

    assert_equal 20, activity.base_cost
  end

  def test_activity_has_total_cost
    activity = Activity.new("hiking")
    activity2 = Activity.new("stand up paddling", 20)

    activity.add_participants("George", 20)
    activity.add_participants("Louis", 40)
    assert_equal 70, activity.total_cost

    activity2.add_participants("Arielle", 10)
    activity2.add_participants("Jacqueline", 50)
    assert_equal 80, activity2.total_cost
  end

  def test_activity_has_fair_cost_per_participant
    activity = Activity.new("hiking")
    activity2 = Activity.new("stand up paddling", 20)

    activity.add_participants("George", 20)
    activity.add_participants("Louis", 40)
    assert_equal 35, activity.fair_cost

    activity2.add_participants("Arielle", 10)
    activity2.add_participants("Jacqueline", 50)
    assert_equal 40, activity2.fair_cost
  end

  def test_calculate_if_participants_is_owed_or_owes_money
    activity = Activity.new("hiking")

    activity.add_participants("George", 20)
    activity.add_participants("Louis", 40)

    assert_equal 35, activity.fair_cost
    assert_equal 15, activity.calculate_owed_owes_money[0]
    assert_equal -5, activity.calculate_owed_owes_money[1]
  end

end
