class Journey
  attr_reader :current_journey

  def initialize(start_location)
    @current_journey = { start: nil, end: nil }
    current_journey[:start] = start_location
  end

  def finish(end_location)
    current_journey[:end] = end_location
  end
end
