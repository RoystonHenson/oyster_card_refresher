class Journey
  attr_reader :current_journey

  def initialize(starting_location)
    @current_journey = { start: nil, end: nil }
    current_journey[:start] = starting_location
  end
end
