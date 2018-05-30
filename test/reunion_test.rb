require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test

  def test_it_exists
    reunion = Reunion.new
    assert_instance_of Reunion, reunion
  end

  def test_reunion_has_location_lake_tahoe_by_default
    reunion = Reunion.new
    assert_equal "Lake Tahoe", reunion.location
  end

  def test_reunion_has_no_activity_when_start
    reunion = Reunion.new

    assert_equal [], reunion.activities
  end

  def test_cann_add_activities_to_reunion
    reunion = Reunion.new
    activity = Activity.new('hiking')
    activity2 = Activity.new('stand up paddle')
    activity.add_participants("George", 20)
    activity.add_participants("Louis", 40)
    activity2.add_participants("Arielle", 10)
    activity2.add_participants("Jacqueline", 50)

    assert_equal ({"George" => 20, "Louis" => 40}), activity.participants

    reunion.add_activities(activity)
    reunion.add_activities(activity2)

    assert_equal 2, reunion.activities.length
  end

  def test_calcul_total_cost_of_reunion
    reunion = Reunion.new
    activity = Activity.new('hiking')
    activity2 = Activity.new('stand up paddle')

    activity.add_participants("George", 20)
    activity.add_participants("Louis", 40)
    activity2.add_participants("Arielle", 10)
    activity2.add_participants("Jacqueline", 50)

    reunion.add_activities(activity)
    reunion.add_activities(activity2)

    assert_equal 150, reunion.total_cost
  end


end
