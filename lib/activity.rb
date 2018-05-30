class Activity
  attr_reader :name,
              :participants,
              :base_cost

  def initialize(name, base_cost = 10)
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

  def calculate_owed_owes_money
    participants_cost = @participants.values
    participants_cost.map do |cost|
      if fair_cost > cost
        fair_cost - cost
      else
        fair_cost - cost
      end
    end
  end

end
