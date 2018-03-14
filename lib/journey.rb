class Journey
  attr_reader :current_journey, :fare, :in_journey, :journey_history

  MIN_FARE = 2.4
  PENALTY_FARE = 6

  @@journey_history = []

  def initialize(start_location)
    @in_journey = true
    @current_journey = { start: nil, end: nil }
    current_journey[:start] = start_location
  end

  def self.journey_history
    @@journey_history
  end

  def finish(end_location)
    current_journey[:end] = end_location
    @in_journey = false
  end

  def calculate_fare
    current_journey[:start].nil? || current_journey[:end].nil? ? @fare = PENALTY_FARE : @fare = MIN_FARE
  end

  def in_journey?
    in_journey
  end
end
