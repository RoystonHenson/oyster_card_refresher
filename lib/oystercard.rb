require 'station'

class Oystercard
  attr_reader :balance, :touched_in, :entry_station, :exit_station, :journeys, :current_journey

  START_BALANCE = 5
  MAX_BALANCE = 90
  FARE = 2.4
  MIN_FARE = 1

  def initialize
    @balance = START_BALANCE
    @current_journey = { 'entry station': nil, 'exit station': nil }
    @journeys = []
  end

  def top_up(amount)
    raise "Maximum balance allowed is £#{MAX_BALANCE}." if balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise 'Not enough funds. Please top up.' if fare_low?
    @current_journey[:'entry station'] = station
  end

  def touch_out(station)
    @current_journey[:'exit station'] = station
    deduct(FARE)
    @journeys << current_journey
    @current_journey = { 'entry station': nil, 'exit station': nil }
  end

  def in_journey?
    !!current_journey[:'entry station']
  end

  private

  def fare_low?
    balance < MIN_FARE
  end

  def deduct(amount)
    @balance -= amount
  end
end
