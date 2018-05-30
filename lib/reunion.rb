class Reunion
  attr_reader :location,
              :activities

  def initialize(location = "Lake Tahoe")
    @location = location
    @activities = []
  end

  def add_activities(activity)
    activity = Activity.new('hiking')
    @activities << activity

  end

  def total_cost
    base_cost_total = @activities.reduce(0) do |sum, activity|
      sum += activity.base_cost
    end
    total_cost_participants = @activities.reduce(0) do |sum, activity|
      sum += activity.participants.values.sum
    end
    base_cost_total + total_cost_participants
  end
end
