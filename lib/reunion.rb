class Reunion
  attr_reader :location,
              :activities

  def initialize(location = "Lake Tahoe")
    @location = location
    @activities = []
  end

  def add_activities(activity)
    activity = Activity.new("hiking")
    @activities << activity
    return activity
  end
end
