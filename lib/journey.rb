class Journey
  attr_reader :current_journey, :fare, :in_journey
  
  MIN_FARE = 2.4
  PENALTY_FARE = 6

  def initialize(start_location)
    @in_journey = true
    @current_journey = { start: start_location, end: nil }
  end

  def finish(end_location)
    current_journey[:end] = end_location
    @in_journey = false
  end

  def calculate_fare
    current_journey[:start].nil? || current_journey[:end].nil? ? @fare = PENALTY_FARE : @fare = MIN_FARE
  end

  def in_journey?
    !current_journey[:end]
  end
end
