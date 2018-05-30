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
    activity = Activity.new("hiking")
    reunion.add_activities(activity)

    assert_equal [activity], reunion.activities
  end
end
