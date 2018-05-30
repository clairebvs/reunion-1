class Activity
  attr_reader :name,
              :participants,
              :base_cost

  def initialize(name, base_cost = 50)
    @name = name
    @participants = {}
    @base_cost = base_cost
  end

  def add_participants(name, cost)
    @participants[name] = cost
  end

  def total_cost
    @base_cost + @participants.values.sum
  end

  def fair_cost
    total_cost / @participants.keys.count
  end

end
