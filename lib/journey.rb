class Journey
  attr_reader :current_journey, :fare

  FARE = 2.4

  def initialize(start_location)
    @current_journey = { start: nil, end: nil }
    current_journey[:start] = start_location
  end

  def finish(end_location)
    current_journey[:end] = end_location
  end

  def calculate_fare
    @fare = FARE
  end
end
