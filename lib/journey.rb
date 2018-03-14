class Journey
  attr_reader :current_journey, :fare, :in_journey, :journey_history

  FARE = 2.4

  def initialize(start_location)
    @in_journey = true
    @current_journey = { start: nil, end: nil }
    current_journey[:start] = start_location
    @journey_history = []
  end

  def finish(end_location)
    current_journey[:end] = end_location
    @in_journey = false
  end

  def calculate_fare
    @fare = FARE
  end

  def in_journey?
    p in_journey
  end
end
